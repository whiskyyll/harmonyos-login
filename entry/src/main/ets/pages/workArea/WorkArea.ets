import { WorkItem } from './WorkItem'
import { IOverallTargets, IWorkTarget } from '../../interface/interface';
import router from '@ohos.router';

class routerParams {
  workTargetList: IWorkTarget[]
  overallTarget: IOverallTargets
  constructor(v1:IWorkTarget[], v2:IOverallTargets) {
    this.workTargetList = v1
    this.overallTarget = v2;
  }
}

@Entry
@Component
struct WorkArea {
  @State workTarget: IWorkTarget[] = []
  @State overallTarget: IOverallTargets = {}

  onPageShow() {
    const pathParam = router.getParams() as routerParams
    this.workTarget = pathParam.workTargetList
    this.overallTarget = pathParam.overallTarget
  }

  build() {
    Column() {
      Column() {
        title($r('app.string.target'), 30)
        targetArea({ param: this.overallTarget })
      }.padding(5)
      Column() {
        title($r('app.string.sub_target'), 25)
        List({ space: 10, initialIndex: 0 }) {
          ForEach(this.workTarget, (item, index) => {
            ListItem() {
              WorkItem({ item, index })
            }
          }, item => item)
        }
        .listDirection(Axis.Vertical)
        .edgeEffect(EdgeEffect.Spring)
        .width('100%')
        .height('100%')
        .scrollBar(BarState.Auto)
      }.padding(5)
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
    .margin({top: 10, bottom: 10})
}

@Builder function targetArea($$: { param: IOverallTargets }) {
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
          .padding({top: 5})
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
        Text('更新时间：')
          .fontSize(14)
          .fontColor($r('app.color.dusty_grey'))
        Text($$.param.updatedTime)
          .fontSize(16)
      }.alignItems(HorizontalAlign.Start)
      Image($r('app.media.pieChart'))
        .width(50)
    }
    .width('100%')
    .justifyContent(FlexAlign.SpaceBetween)
    .margin({top: 10})

  }
  .alignItems(HorizontalAlign.Start)
  .backgroundColor($r('app.color.start_window_background'))
  .padding(15)
  .borderRadius(15)
}