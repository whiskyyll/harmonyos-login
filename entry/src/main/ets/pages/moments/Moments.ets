import { Moment } from '../../model/Moment'
import { MyMoments } from '../../model/Mymoments'
import { UserInfo } from '../../model/UserInfo'
import { MomentsInfo } from '../../view/MomentInfo'

const testData = [{
  content: '沙发！',
  images: [
    {
      url: 'https://xianmobilelab.gitlab.io/moments-data/images/tweets/001.jpeg'
    },
    {
      url: 'https://xianmobilelab.gitlab.io/moments-data/images/tweets/002.jpeg'
    },
    {
      url: 'https://xianmobilelab.gitlab.io/moments-data/images/tweets/003.jpeg'
    }
  ],
  sender: {
    username: 'cyao',
    nick: 'Cheng Yao',
    avatar: 'https://xianmobilelab.gitlab.io/moments-data/images/user/avatar/001.jpeg'
  },
  comments: [
    {
      content: 'Good.',
      sender: {
        username: 'leihuang',
        nick: 'Lei Huang',
        avatar: 'https://xianmobilelab.gitlab.io/moments-data/images/user/avatar/002.jpeg'
      }
    },
    {
      content: 'Like it too',
      sender: {
        username: 'weidong',
        nick: 'WeiDong Gu',
        avatar: 'https://xianmobilelab.gitlab.io/moments-data/images/user/avatar/003.jpeg'
      }
    }
  ]
},
  {
    content: '沙发！',
    images: [
      {
        url: 'https://xianmobilelab.gitlab.io/moments-data/images/tweets/001.jpeg'
      },
      {
        url: 'https://xianmobilelab.gitlab.io/moments-data/images/tweets/002.jpeg'
      },
      {
        url: 'https://xianmobilelab.gitlab.io/moments-data/images/tweets/003.jpeg'
      }
    ],
    sender: {
      username: 'cyao',
      nick: 'Cheng Yao',
      avatar: 'https://xianmobilelab.gitlab.io/moments-data/images/user/avatar/001.jpeg'
    },
    comments: [
      {
        content: 'Good.',
        sender: {
          username: 'leihuang',
          nick: 'Lei Huang',
          avatar: 'https://xianmobilelab.gitlab.io/moments-data/images/user/avatar/002.jpeg'
        }
      },
      {
        content: 'Like it too',
        sender: {
          username: 'weidong',
          nick: 'WeiDong Gu',
          avatar: 'https://xianmobilelab.gitlab.io/moments-data/images/user/avatar/003.jpeg'
        }
      }
    ]
  },
  {
    content: '沙发！',
    images: [
      {
        url: 'https://xianmobilelab.gitlab.io/moments-data/images/tweets/001.jpeg'
      },
      {
        url: 'https://xianmobilelab.gitlab.io/moments-data/images/tweets/002.jpeg'
      },
      {
        url: 'https://xianmobilelab.gitlab.io/moments-data/images/tweets/003.jpeg'
      }
    ],
    sender: {
      username: 'cyao',
      nick: 'Cheng Yao',
      avatar: 'https://xianmobilelab.gitlab.io/moments-data/images/user/avatar/001.jpeg'
    },
    comments: [
      {
        content: 'Good.',
        sender: {
          username: 'leihuang',
          nick: 'Lei Huang',
          avatar: 'https://xianmobilelab.gitlab.io/moments-data/images/user/avatar/002.jpeg'
        }
      },
      {
        content: 'Like it too',
        sender: {
          username: 'weidong',
          nick: 'WeiDong Gu',
          avatar: 'https://xianmobilelab.gitlab.io/moments-data/images/user/avatar/003.jpeg'
        }
      }
    ]
  },
  {
    content: '沙发！',
    images: [
      {
        url: 'https://xianmobilelab.gitlab.io/moments-data/images/tweets/001.jpeg'
      },
      {
        url: 'https://xianmobilelab.gitlab.io/moments-data/images/tweets/002.jpeg'
      },
      {
        url: 'https://xianmobilelab.gitlab.io/moments-data/images/tweets/003.jpeg'
      }
    ],
    sender: {
      username: 'cyao',
      nick: 'Cheng Yao',
      avatar: 'https://xianmobilelab.gitlab.io/moments-data/images/user/avatar/001.jpeg'
    },
    comments: [
      {
        content: 'Good.',
        sender: {
          username: 'leihuang',
          nick: 'Lei Huang',
          avatar: 'https://xianmobilelab.gitlab.io/moments-data/images/user/avatar/002.jpeg'
        }
      },
      {
        content: 'Like it too',
        sender: {
          username: 'weidong',
          nick: 'WeiDong Gu',
          avatar: 'https://xianmobilelab.gitlab.io/moments-data/images/user/avatar/003.jpeg'
        }
      }
    ]
  },
  {
    content: '沙发！',
    images: [
      {
        url: 'https://xianmobilelab.gitlab.io/moments-data/images/tweets/001.jpeg'
      },
      {
        url: 'https://xianmobilelab.gitlab.io/moments-data/images/tweets/002.jpeg'
      },
      {
        url: 'https://xianmobilelab.gitlab.io/moments-data/images/tweets/003.jpeg'
      }
    ],
    sender: {
      username: 'cyao',
      nick: 'Cheng Yao',
      avatar: 'https://xianmobilelab.gitlab.io/moments-data/images/user/avatar/001.jpeg'
    },
    comments: [
      {
        content: 'Good.',
        sender: {
          username: 'leihuang',
          nick: 'Lei Huang',
          avatar: 'https://xianmobilelab.gitlab.io/moments-data/images/user/avatar/002.jpeg'
        }
      },
      {
        content: 'Like it too',
        sender: {
          username: 'weidong',
          nick: 'WeiDong Gu',
          avatar: 'https://xianmobilelab.gitlab.io/moments-data/images/user/avatar/003.jpeg'
        }
      }
    ]
  }
]

@Entry
@Component
struct Moments {
  @State myMoments: MyMoments = new MyMoments()
  @State isUpdating: boolean = false

  onPageShow() {
    // this.myMoments.userInfo = {
    //   profileImage: 'https://xianmobilelab.gitlab.io/moments-data/images/user/profile-image.jpeg',
    //   avatar: 'https://xianmobilelab.gitlab.io/moments-data/images/user/avatar.png',
    //   nick: 'Huan Huan',
    //   username: 'hengzeng'
    // }
    //
    // this.myMoments.momentList = testData
    this.myMoments.initial()
  }

  updateComment(index: number, comment: string) {
    this.myMoments.updateComment(index, comment)
    this.myMoments.momentList = [ ...this.myMoments.momentList ]
  }

  build() {
    Scroll() {
      Column() {
        momentHeader({ param: this.myMoments.userInfo })
        if (this.isUpdating) {
          LoadingProgress()
        }
        Column({ space: 10 }) {
          ForEach(this.myMoments.momentList, (moment: Moment, index) => {
            MomentsInfo({
              moment: this.myMoments.momentList[index],
              addComment: (text) => {
                this.updateComment(index, text)
              } })
          })
        }
        .width('100%')
      }

    }
    .align(Alignment.TopStart)
    .height('100%')
    .width('100%')
    .backgroundColor($r('app.color.page_background'))
    .onScrollEdge((side: Edge) => {
      if (side === Edge.Top) {
        // this.myMoments.momentList = testData
        this.myMoments.refresh()
        this.myMoments.momentList = [ ...this.myMoments.momentList ]
      }

      if (side === Edge.Bottom) {
        // const test = this.myMoments.momentList
        // this.myMoments.momentList = test.concat(test)
        this.myMoments.loadMore()
        this.myMoments.momentList = [ ...this.myMoments.momentList ]
      }
    })
  }
}

@Builder
export function momentHeader($$: { param: UserInfo }) {
  Column() {
    Stack({ alignContent: Alignment.TopEnd }) {
      Image($$.param?.profileImage)
        .width('100%')
        .height(300)
      Row() {
        Text(`${$$.param?.nick || ''} `)
          .margin({ top: 40 })
          .fontWeight(700)
        Image($$.param?.avatar)
          .width(80)
          .height(80)
          .backgroundColor($r('app.color.start_window_background'))
      }
      .alignSelf(ItemAlign.Start)
      .alignItems(VerticalAlign.Top)
      .margin({ top: 260, right: 10 })
    }
  }
  .height(350)
}