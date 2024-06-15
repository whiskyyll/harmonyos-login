import router from '@ohos.router';
import { RouterParams } from '../../model/RouterParams';
import { WeatherInfo } from '../../model/WeatherInfo';
import { CityWeather } from '../../model/CityWeather';

@Entry
@Component
struct Weather {
  @State cityWeather: CityWeather = new CityWeather();

  // aboutToAppear() {
  //   this.cityWeather.updateWeathers()
  // }

  onPageShow() {
    const pathParam = router.getParams() as RouterParams
    if (pathParam) {
      this.cityWeather.currentWeather = pathParam.data.currentWeather;
      this.cityWeather.futureWeatherList = pathParam.data.futureWeatherList;
    }
  }

  build() {
    Column() {
      Row() {
        Column() {
          Row() {
            Text(`${this.cityWeather.currentWeather?.temp?.toFixed(1) || '-'}°`)
              .fontSize(50)
              .fontWeight(FontWeight.Bold)
            if (this.cityWeather.currentWeather?.weatherIcon) {
              Image(`https://openweathermap.org/img/wn/${this.cityWeather.currentWeather.weatherIcon}@2x.png`)
                .width(50)
                .height(50)
            }
          }

          Text(`未来24小时：${this.cityWeather.futureMinTemp?.toFixed(1) || '-'}°/${this.cityWeather.futureMaxTemp?.toFixed(1) || '-'}°`)
        }
        .alignItems(HorizontalAlign.Start)

        Column() {
          Text(`${this.cityWeather.currentWeather?.description || '-'}`)
          Text(`体感温度：${this.cityWeather.currentWeather?.feelTemp?.toFixed(1) || '-'}°`)
        }
      }
      .height(200)
      .width('100%')
      .padding(10)
      .backgroundColor($r('app.color.link'))
      .justifyContent(FlexAlign.SpaceBetween)

      Text('3小时天气预报')
        .alignSelf(ItemAlign.Start)
        .margin(10)
      Scroll() {
        Row() {
          ForEach(this.cityWeather.futureWeatherList, (future: WeatherInfo) => {
            Column() {
              Text(`${future.temp.toFixed(0)}°`)
              Image(`https://openweathermap.org/img/wn/${future.weatherIcon}@2x.png`)
                .width(30)
                .height(30)
              Text(`${future.date.split(' ')[1]}`)
            }
            .margin({ left: 3, right: 3 })
          })
        }
        .width('100%')
        .justifyContent(FlexAlign.Start)
        .backgroundColor($r('app.color.link'))
      }
      .backgroundColor(0xDCDCDC)
      .scrollable(ScrollDirection.Horizontal)
      .scrollBarColor(Color.Gray)
      .scrollBarWidth(10)
      .edgeEffect(EdgeEffect.Spring)
    }
    .height('100%')
    .width('100%')
  }
}