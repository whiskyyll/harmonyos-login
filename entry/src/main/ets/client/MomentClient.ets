import http from '@ohos.net.http'

export class MomentClient {

  getUserInfo() {
    const httpInstance = http.createHttp();
    return httpInstance.request('https://xianmobilelab.gitlab.io/moments-data/user.json', {
      method: http.RequestMethod.GET,
      header: {
        'Content-Type': 'application/json'
      }
    })
  }

  getAllMoment() {
    const httpInstance = http.createHttp();
    return httpInstance.request('https://xianmobilelab.gitlab.io/moments-data/tweets.json', {
      method: http.RequestMethod.GET,
      header: {
        'Content-Type': 'application/json'
      }
    })
  }
}