import { MomentService } from '../service/MomentService';
import { Moment } from './Moment'
import { UserInfo } from './UserInfo';

@Observed
export class MyMoments {
  userInfo: UserInfo;
  momentList: Moment[] = [];
  maxSize: number = 0;
  momentService: MomentService = new MomentService();

  initial() {
    this.momentService.getUserInfo()
      .then(data => this.userInfo = data)

    this.momentService.getMoments(0)
      .then(data => {
        this.momentList = data.moments
        this.maxSize = data.maxSize
      })
  }

  loadMore() {
    console.log('loadMore', this.maxSize)
    if (this.momentList.length === this.maxSize) {
      return
    }
    this.momentService.getMoments(this.momentList.length)
      .then(data => {
        this.momentList = this.momentList.concat(data.moments)
        this.maxSize = data.maxSize
      })
  }

  refresh() {
    this.momentList = []
    this.maxSize = 0
    this.momentService.getMoments(0)
      .then(data => {
        this.momentList = data.moments
        this.maxSize = data.maxSize
      })

  }

  updateComment(index: number, comment: string) {
    const moment: Moment[] = this.momentList[index].comments
    const existComments: Moment[] = moment || []
    const newComment: Moment[] = [{
      sender: { nick: this.userInfo.nick },
      content: comment
    }]
    console.log('in updateComment', index, comment)
    this.momentList[index].comments = existComments.concat(newComment)

    console.log('updateComment', JSON.stringify(this.momentList[index].comments))
  }
}