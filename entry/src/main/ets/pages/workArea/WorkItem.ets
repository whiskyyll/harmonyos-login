import { WorkTarget } from '../../model/WorkTarget';

@Component
export struct WorkItem {
  @ObjectLink item: WorkTarget;
  private index: number;
  onSelect: () => void = () => {
  }

  onCompleted: () => void = () => {
  }

  build() {
    Column() {
      Row() {
        Text(this.item.target)
          .fontSize(16)
          .textAlign(TextAlign.Start)
          .fontWeight(FontWeight.Bold)
        .width(100)
        Row() {
          Column() {
            Text(`${this.item.progress}%`)
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
            Text(`更新时间：${this.item.updatedTime}`)
              .fontSize(14)
              .fontColor($r('app.color.dusty_grey'))
          }
          .alignItems(HorizontalAlign.End)

          Checkbox({ name: `${this.item.target}-${this.index}`, group: 'checkboxGroup' })
            .selectedColor('#007DFF')
            .onChange((value: boolean) => {
              console.info('Checkbox1 change is' + value)
            })
            .margin({ left: 5 })
            .visibility(this.item.canBeSelect ? Visibility.Visible : Visibility.None)
        }
      }
      .width('100%')
      .alignItems(VerticalAlign.Center)
      .justifyContent(FlexAlign.SpaceBetween)
      .onClick(() => this.onSelect())

      if (this.item.selected) {
        Row() {
          Text($r('app.string.completed')).fontSize(20).fontColor($r('app.color.link'))
            .onClick(() => {
              this.item.progress = 100
              const date = new Date();
              this.item.updatedTime = `${date.getFullYear()}/${date.getMonth() + 1}/${date.getDate()}`
              this.item.selected = false
              this.onCompleted()
            })
            .margin({ right: 5 })
          Text($r('app.string.cancel')).fontSize(20).fontColor($r('app.color.link'))
            .onClick(() => this.item.selected = false)
        }
        .margin({ top: 10 })
        .width('60%')
        .justifyContent(FlexAlign.SpaceBetween)
      }
    }
    .width('100%')
    .padding(10)
    .borderRadius(10)
    .backgroundColor($r('app.color.start_window_background'))
    .onClick(() => this.onSelect())
  }
}