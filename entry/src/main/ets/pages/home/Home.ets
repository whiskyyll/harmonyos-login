import router from '@ohos.router'
import hilog from '@ohos.hilog';
import WeatherUtil from '../../utils/WeatherUtil';
import { CityWeather } from '../../model/CityWeather';

@Entry
@Component
struct Home {

  build() {
    Row() {
      Text('天气')
        .onClick(() => {
          WeatherUtil.getExistWeatherInfo()
            .then(data => {
              const weatherInfo = JSON.parse(data) as CityWeather;
            router.pushUrl({ url: 'pages/weather/Weather', params: { data: weatherInfo } })
              .catch((err) => {
                console.debug('weather err', err)
              })})
          })
        .backgroundColor($r('app.color.start_window_background'))
        .height(30)
        .width('100%')
        .padding({ left: 10 })
        .borderRadius(10)
    }
    .height('100%')
    .width('100%')
    .backgroundColor($r('app.color.page_background'))
    .alignItems(VerticalAlign.Top)
    .justifyContent(FlexAlign.Center)
    .padding(10)
  }
}