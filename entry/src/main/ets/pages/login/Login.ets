import router from '@ohos.router';

@Entry
@Component
struct Login {
  @State account: string = ''
  @State showAccountError: Visibility = Visibility.Hidden
  @State showPasswordError: Visibility = Visibility.Hidden
  @State password: string = ''

  build() {
    Column() {
      loginTitle()
      Column() {
        TextInput({ placeholder: $r('app.string.account') })
          .type(InputType.Normal)
          .margin({ top: 10 })
          .width('90%')
          .onChange((value: string) => {
            if (value) {
              this.account = value;
            }
            if (value.length > 0) {
              this.showAccountError = Visibility.Hidden
            }
          })
        Text('账号不可为空')
          .fontSize(10)
          .fontColor($r('app.color.error'))
          .fontWeight(FontWeight.Bold)
          .visibility(this.showAccountError)
          .alignSelf(ItemAlign.Start)
          .padding({ left: 20, top: 5, bottom: 5 })
        TextInput({ placeholder: $r('app.string.password') })
          .type(InputType.Password)
          .width('90%')
          .onChange((value: string) => {
            if (value) {
              this.password = value;
            }
            if (value.length > 0) {
              this.showPasswordError = Visibility.Hidden
            }
          })
        Text('密码不可为空')
          .fontSize(10)
          .fontColor($r('app.color.error'))
          .fontWeight(FontWeight.Bold)
          .visibility(this.showPasswordError)
          .alignSelf(ItemAlign.Start)
          .padding({ left: 20, top: 5, bottom: 5 })
        Row() {
          Text() {
            Span($r('app.string.sms_verify_code'))
              .fontSize(12)
              .fontColor($r('app.color.link'))
              .onClick(() => {
                console.info('temporarily do nothing')
              })
          }

          Text() {
            Span($r('app.string.forget_password'))
              .fontSize(12)
              .fontColor($r('app.color.link'))
              .onClick(() => {
                console.info('temporarily do nothing')
              })
          }
        }.justifyContent(FlexAlign.SpaceBetween)
        .width('90%')
        .margin({ bottom: 20 })

        Button($r('app.string.sign_in')).width(150).margin({ top: 20 })
          .onClick(() => {
            console.log('click')
            if (this.account.length > 0 && this.password.length > 0) {
              console.log('in jump')
              router.pushUrl({
                url: 'pages/workArea/WorkArea',
                params: {
                  workTargetList: [{target: '子目标2', progress: 0, updatedTime: '2024/05/01'}],
                  overallTarget: { period: '第一季度', target: '实现用户量与用户活跃度提升', progress: 0.5, updatedTime: '03/06/2024 19:20' },
                }
              }, (err) => {
                if (err) {
                  console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
                  return;
                }
                console.info('pushUrl success');
              });
            }
            if (this.account.length <= 0) {
              this.showAccountError = Visibility.Visible
            }
            if (this.password.length <= 0) {
              this.showPasswordError = Visibility.Visible
            }
          })
      }
      otherLoginWay()
    }
    .height('100%')
    .backgroundColor($r('app.color.page_background'))
    .justifyContent(FlexAlign.SpaceBetween)
    .alignItems(HorizontalAlign.Center)
  }
}

@Builder function loginTitle() {
  Column() {
    Image($r('app.media.img'))
      .width(80)
      .borderRadius(20)
    Text($r('app.string.login_title'))
      .fontSize(40)
      .fontWeight(FontWeight.Bold)
      .padding({ top: 6 })
    Text($r('app.string.login_tip'))
      .fontSize(16)
      .padding({ top: 6 })
  }
  .width('100%')
  .margin({ top: 80 })
}

@Builder function otherLoginWay() {
  Column() {
    Text($r('app.string.login_way'))
      .fontSize(14)
      .fontColor($r('app.color.dusty_grey'))
      .margin({ bottom: 10 })
    Row() {
      Image($r('app.media.huawei'))
        .width(30)
      Image($r('app.media.gmail'))
        .width(30)
      Image($r('app.media.steam'))
        .width(30)
    }
    .width('60%')
    .justifyContent(FlexAlign.SpaceBetween)
  }.margin({ bottom: 20 })
}