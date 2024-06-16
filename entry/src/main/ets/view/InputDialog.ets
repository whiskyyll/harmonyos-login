@CustomDialog
export struct CustomDialogExample {
  @Link newComment: string

  inputText?: string
  controller?: CustomDialogController
  @State errorMsg: string = ''

  build() {
    Column() {
      Text($r('app.string.add_sub_tartget'))
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 10, bottom: 10, left: 20 })
        .alignSelf(ItemAlign.Start)
      TextArea({ placeholder: '', text: this.inputText }).width('90%')
        .onChange((value: string) => {
          if (value && value.trim().length > 0) {
            this.inputText = value
            this.errorMsg = ''
          } else {
            this.errorMsg = '评论不可为空'
          }
        })
      Text(this.errorMsg)
        .fontSize(10)
        .fontColor($r('app.color.error'))
        .fontWeight(FontWeight.Bold)
        .margin({ top: 3 })
        .visibility(this.errorMsg === '' ? Visibility.None : Visibility.Visible)
      Flex({ justifyContent: FlexAlign.SpaceAround }) {
        Text($r('app.string.cancel'))
          .onClick(() => {
            this.controller.close()
          }).fontColor(Color.Blue)
        Text('确定')
          .onClick(() => {
            if (this.errorMsg !== '') {
              return;
            }
            if (this.controller != undefined) {
              if (this.inputText && this.inputText.trim().length > 0) {
                this.newComment = this.inputText.trim()
                this.controller.close()
              } else {
                this.errorMsg = '评论不可为空'
              }
            }
          }).fontColor(Color.Blue)
      }
      .margin({ top: 3 })
    }.borderRadius(5)
    .margin(10)
  }
}