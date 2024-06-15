import http from '@ohos.net.http';

export function getCityWeather() {
  const client = http.createHttp();
  return client.request('https://api.openweathermap.org/data/2.5/weather?units=metric&lang=zh_cn&appid=7ce48fbdedcc72653e589f93b4da7ee4&q=Chengdu,CN', {
    method: http.RequestMethod.GET,
    header: {
      'Content-Type': 'application/json'
    }
  })
}

export function getFutureWeather() {
  const client = http.createHttp();
  return client.request('https://api.openweathermap.org/data/2.5/forecast?appid=7ce48fbdedcc72653e589f93b4da7ee4&units=metric&lang=zh_cn&q=Chengdu,CN', {
    method: http.RequestMethod.GET,
    header: {
      'Content-Type': 'application/json'
    }
  })
}