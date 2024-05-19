import { IWorkTarget } from '../../interface/interface';

@Component
export struct WorkItem {
  private item: IWorkTarget;
  private index: number;

  build() {
    Row() {
      Text(this.item.target)
        .fontSize(16)
        .textAlign(TextAlign.Start)
        .fontWeight(FontWeight.Bold)
      Column() {
        Text(`${this.item.progress}%`)
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
        Text(`更新时间：${this.item.updatedTime}`)
          .fontSize(14)
          .fontColor($r('app.color.dusty_grey'))
      }
      .alignItems(HorizontalAlign.End)
    }
    .width('100%')
    .height(60)
    .padding(10)
    .borderRadius(10)
    .alignItems(VerticalAlign.Center)
    .justifyContent(FlexAlign.SpaceBetween)
    .backgroundColor($r('app.color.start_window_background'))
  }
}