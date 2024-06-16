import promptAction from '@ohos.promptAction';
import { MomentClient } from '../client/MomentClient';
import { Moment } from '../model/Moment';
import { UserInfo } from '../model/UserInfo';
import MomentsUtil from '../utils/MomentsUtil';

export class MomentService {
  momentClient: MomentClient = new MomentClient();

  getUserInfo() {
    return this.momentClient.getUserInfo()
      .then(res => {
        const data = res.result as string
        const resData = JSON.parse(data) as any
        return {...resData, profileImage: resData['profile-image']}
      })
      .catch(err => {
        console.error('initial error', err)
        promptAction.showToast({ message: '数据加载失败', duration: 300 })
        return {} as UserInfo
      })
  }

  getMoments(currentSize: number) {
    return MomentsUtil.getExistMoments()
      .then((data: Moment[]) => {
        if (data.length === 0) {
          return this.loadAllAndCache()
        }
        console.log('moment useExistMoments')
        return {
          moments: data.slice(currentSize, Math.min(data.length, currentSize + 3)),
          maxSize: data.length
        }
      })

  }

  private loadAllAndCache() {
    console.log('moment loadAllAndCache')
    return this.momentClient.getAllMoment()
      .then(res => {
        const originalData = res.result as string
        const moments = JSON.parse(originalData) as Moment[]
        const validMoments = moments.filter((moment: Moment) => {
          return moment.content && moment.sender
        })
        MomentsUtil.cacheMoments(validMoments)
        return {
          moments: validMoments.slice(0, 3),
          maxSize: validMoments.length
        }
      })
  }
}