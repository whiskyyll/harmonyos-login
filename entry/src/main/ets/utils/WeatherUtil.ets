import dataPreferences from '@ohos.data.preferences';
import hilog from '@ohos.hilog';
import { GlobalContext } from './GlobalContext';

const TAG = '[PreferencesUtil]';
const PREFERENCES_NAME = 'myWeather';
const KEY_APP_WEATHER = 'weatherInfo';

export class WeatherUtil {
  constructor() {
  }

  createWeatherInfo(context: Context) {
    let weatherInfo: Function = (() => {
      let info: Promise<dataPreferences.Preferences> = dataPreferences.getPreferences(context,
        PREFERENCES_NAME);
      return info;
    });
    console.log('createWeatherInfo', weatherInfo)
    GlobalContext.getContext().setObject('getWeatherInfo', weatherInfo);
  }

  saveWeather(weather: any, isInitial: boolean = false) {
    let getWeatherInfo: Function = GlobalContext.getContext().getObject('getWeatherInfo') as Function;
    getWeatherInfo().then(async (preferences: dataPreferences.Preferences) => {
      preferences.has(KEY_APP_WEATHER).then(async (isExist) => {
        if (isInitial && isExist) {
          console.log('weather', isExist)
          return;
        }
        const value = JSON.stringify(weather);
        await preferences.put(KEY_APP_WEATHER, value);
        preferences.flush();
        console.log('weather put')
      })
        .catch((err) => {
          console.error(TAG, 'put the preferences failed, err: ' + err);
        })
    }).catch((err: Error) => {
      console.error(TAG, 'put the preferences failed, err: ' + err);
    });
  }

  async getExistWeatherInfo() {
    let existWeather = '{}';
    const getWeatherInfo: Function = GlobalContext.getContext().getObject('getWeatherInfo') as Function
    existWeather = await (await getWeatherInfo()).get(KEY_APP_WEATHER, existWeather)
    console.debug('weather', existWeather)
    return existWeather
  }

}

export default new WeatherUtil()