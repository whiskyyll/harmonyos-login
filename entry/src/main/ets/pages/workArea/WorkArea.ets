import { WorkItem } from './WorkItem'
import { IOverallTargets, RouterParams, ITargetStatistics } from '../../model/model';
import router from '@ohos.router';
import { CustomDialogExample } from '../../view/InputDialog';
import { WorkTarget } from '../../model/WorkTarget';

@Entry
@Component
struct WorkArea {
  @State workTarget: WorkTarget[] = [new WorkTarget('子目标2', '2024/05/01', 0)]
  @State overallTarget: IOverallTargets = {
    period: '第一季度',
    target: '实现用户量与用户活跃度提升',
    progress: 0.5,
    updatedTime: '03/06/2024 19:20'
  }
  @State workProgress: ITargetStatistics = { completed: 0, total: 1 }
  @State @Watch('onAccept') newTarget: string = '';
  @State isEditing: boolean = false;
  selectedItemIndex: string[] = [];
  dialogController: CustomDialogController = new CustomDialogController({
    builder: CustomDialogExample({
      newTarget: $newTarget,
      isInvalid: (value) => this.workTarget.some(target => target.target === value)
    }),
    autoCancel: true,
    alignment: DialogAlignment.Center,
    offset: { dx: 0, dy: -20 },
    gridCount: 4,
    customStyle: false
  })

  onAccept() {
    const date = new Date()
    this.workTarget.push(new WorkTarget(this.newTarget, `${date.getFullYear()}/${date.getMonth() + 1}/${date.getDate()}`, 0));
    this.workProgress.total = this.workTarget.length
  }

  onCancel() {

  }

  onPageShow() {
    const pathParam = router.getParams() as RouterParams
    if (pathParam) {
      this.workTarget = pathParam.workTargetList
      this.overallTarget = pathParam.overallTarget
    }
  }

  build() {
    Column() {
      Column() {
        title($r('app.string.target'), 30)
        targetArea({ param: this.overallTarget, progress: this.workProgress })
      }.padding(5)

      Column() {
        Row() {
          title($r('app.string.sub_target'), 25)
          Text($r('app.string.edit')).fontSize(20).fontColor($r('app.color.link'))
            .visibility(this.isEditing ? Visibility.None : Visibility.Visible)
            .onClick(() => {
              this.isEditing = true
              this.workTarget.forEach(target => {
                target.selected = false
                if (target.progress != 100) {
                  target.canBeSelect = true
                }
              })
            })
          Row() {
            Text($r('app.string.cancel')).fontSize(20).fontColor($r('app.color.link'))
              .onClick(() => {
                this.isEditing = false
                this.workTarget.forEach(target => target.canBeSelect = false)
              })
              .margin({ right: 5 })
            Text($r('app.string.selectAll')).fontSize(20).fontColor($r('app.color.link'))
            CheckboxGroup({ group: 'checkboxGroup' })
              .selectedColor('#007DFF')
              .onChange((itemName: CheckboxGroupResult) => {
                this.selectedItemIndex = itemName.name.map(item => item.split('-').reverse()[0])
                console.log('selected', this.selectedItemIndex);
              })
          }
          .visibility(this.isEditing ? Visibility.Visible : Visibility.None)
        }
        .justifyContent(FlexAlign.SpaceBetween)
        .width('100%')

        List({ space: 10, initialIndex: 0 }) {
          ForEach(this.workTarget, (item: WorkTarget, index: number) => {
            ListItem() {
              WorkItem({
                item: this.workTarget[index],
                index,
                onSelect: () => {
                  if (this.isEditing) {
                    return;
                  }
                  this.workTarget.forEach(target => target.selected = false)
                  this.workTarget[index].selected = true
                },
                onCompleted: () => {
                  this.workProgress.completed += 1
                }
              })
            }
          }, item => item)
        }
        .listDirection(Axis.Vertical)
        .edgeEffect(EdgeEffect.Spring)
        .width('100%')
        .height('54%')
        .scrollBar(BarState.Auto)
      }.padding(5)

      Button($r('app.string.add_sub_tartget'), { type: ButtonType.Capsule, stateEffect: true })
        .fontColor($r('app.color.link'))
        .fontSize(16)
        .backgroundColor($r('app.color.grey'))
        .width(120)
        .height(40)
        .visibility(this.isEditing ? Visibility.None : Visibility.Visible)
        .onClick(() => this.dialogController.open())
      Button($r('app.string.delete'), { type: ButtonType.Capsule, stateEffect: true })
        .fontColor($r('app.color.error'))
        .backgroundColor($r('app.color.start_window_background'))
        .fontSize(18)
        .width(120)
        .height(40)
        .visibility(this.isEditing ? Visibility.Visible : Visibility.None)
        .onClick(() => {
          this.workTarget.forEach(target => target.canBeSelect = false)
          this.workTarget = this.workTarget
            .filter((target, index) =>!this.selectedItemIndex.includes(index.toString()))
          this.workProgress.total = this.workTarget.length
          this.isEditing = false
        })
    }
    .padding(10)
    .height('100%')
    .backgroundColor($r('app.color.page_background'))
  }
}

@Builder function title(text: ResourceStr, fontSize: number) {
  Text(text)
    .fontSize(fontSize)
    .fontWeight(FontWeight.Bold)
    .alignSelf(ItemAlign.Start)
    .margin({ top: 10, bottom: 10 })
}

@Builder function targetArea($$: {
  param: IOverallTargets,
  progress: ITargetStatistics
}) {
  Column() {
    Row() {
      Image($r('app.media.workList'))
        .width(100)
      Column() {
        Text(`${$$.param.period}运营目标`)
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
        Text($$.param.target)
          .fontSize(14)
          .fontColor($r('app.color.dusty_grey'))
          .padding({ top: 5 })
      }
      .justifyContent(FlexAlign.Start)
      .alignItems(HorizontalAlign.Start)
      .margin({ left: 10 })

    }
    .width('100%')
    .justifyContent(FlexAlign.Start)
    .alignItems(VerticalAlign.Top)

    Row() {
      Column() {
        Text($r('app.string.overall_progress'))
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
        Text(`${$r('app.string.updated_time')}：`)
          .fontSize(14)
          .fontColor($r('app.color.dusty_grey'))
        Text($$.param.updatedTime)
          .fontSize(16)
      }.alignItems(HorizontalAlign.Start)

      Stack() {
        Progress({ value: $$.progress.completed, total: $$.progress.total, type: ProgressType.Ring })
          .color($r('app.color.link')).width(50)
          .style({ strokeWidth: 5, scaleCount: 30, scaleWidth: 20 })
        Row() {
          Text($$.progress.completed.toString())
            .fontSize(10)
            .fontColor($r('app.color.link'))
          Text('/' + $$.progress.total.toString())
            .fontSize(10)
        }
      }
    }
    .width('100%')
    .justifyContent(FlexAlign.SpaceBetween)
    .margin({ top: 10 })

  }
  .alignItems(HorizontalAlign.Start)
  .backgroundColor($r('app.color.start_window_background'))
  .padding(15)
  .borderRadius(15)
}