import { Moment } from '../model/Moment';
import { CustomDialogExample } from './InputDialog';

@Component
export struct MomentsInfo {
  @ObjectLink moment: Moment;
  addComment: (text: string) => void;
  @State @Watch('onAccept') newComment: string = '';
  dialogController: CustomDialogController = new CustomDialogController({
    builder: CustomDialogExample({
      newComment: $newComment,
    }),
    autoCancel: true,
    alignment: DialogAlignment.Bottom,
    offset: { dx: 0, dy: -20 },
    gridCount: 4,
    customStyle: false
  })

  onAccept() {
    console.log('MomentsInfo onAccept', this.newComment)
    this.addComment(this.newComment)
  }

  build() {
    Row() {
      Image(this.moment.sender?.avatar)
        .width(60)
        .height(60)
      Column() {
        Text(`${this.moment.sender?.nick || ''} `)
          .fontWeight(700)
        Text(`${this.moment.content || ''} `)
        if (this.moment.images && this.moment.images.length > 0) {
          Grid() {
            ForEach(this.moment.images, (image: { url: string }) => {
              GridItem() {
                Image(image.url)
                  .width(50)
                  .height(50)
              }
            }, image => image)
          }
          .layoutDirection(GridDirection.Row)
          .maxCount(3)
          .columnsGap(10)
          .rowsGap(10)
        }
        Text('评论')
          .fontSize(10)
          .alignSelf(ItemAlign.End)
          .fontColor($r('app.color.dusty_grey'))
          .onClick(() => this.dialogController.open())
        Column() {
          ForEach(this.moment.comments, (comment: Moment) => {
            Text(`${comment.sender.nick}：${comment.content}`)
              .fontSize(10)
          })
        }
        .alignItems(HorizontalAlign.Start)
        .backgroundColor($r('app.color.start_window_background'))
        .margin({ top: 5 })
        .padding(3)
        .borderRadius(5)
        .width('80%')
      }
      .width('80%')
      .padding({ left: 10 })
      .alignItems(HorizontalAlign.Start)
      .justifyContent(FlexAlign.Start)
    }
    .alignItems(VerticalAlign.Top)
    .justifyContent(FlexAlign.Start)
    .padding(20)
  }
}