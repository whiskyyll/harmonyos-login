import promptAction from '@ohos.promptAction';
import { getCityWeather, getFutureWeather } from '../utils/WeatherRequest';
import WeatherUtil from '../utils/WeatherUtil';
import { LatestWeatherResponse, WeatherResponse } from './interface';
import { WeatherInfo } from './WeatherInfo';

@Observed
export class CityWeather {
  currentWeather: WeatherInfo;
  futureWeatherList: WeatherInfo[] = [];
  futureMaxTemp: number;
  futureMinTemp: number;

  updateWeathers() {
    getCityWeather()
      .then(res => {
        const result = res.result as string
        const data = JSON.parse(result) as WeatherResponse
        this.currentWeather = {
          temp: data.main.temp,
          weatherIcon: data.weather[0].icon,
          description: data.weather[0].description,
          feelTemp: data.main.feels_like
        };

        getFutureWeather()
          .then((res) => {
            const result = res.result as string
            const data = JSON.parse(result) as { list: LatestWeatherResponse[] }
            this.futureWeatherList = data.list.map((weather: LatestWeatherResponse) => {
              return {
                temp: weather.main.temp,
                weatherIcon: weather.weather[0].icon,
                date: weather.dt_txt
              }
            })
            console.log('aboutToAppear')
            promptAction.showToast({
              message: '天气刷新成功',
              duration: 2000,
            })
          })
          .catch(err => {
            console.error('failed to get weather', err)
            promptAction.showToast({
              message: '获取最近天气失败',
              duration: 2000,
            })
          })
      })
      .catch(err => {
        console.error('failed to get weather', err)
        promptAction.showToast({
          message: '获取实时天气失败',
          duration: 2000,
        })
      })

    WeatherUtil.saveWeather({ currentWeather: this.currentWeather, futureWeatherList: this.futureWeatherList })
  }
}