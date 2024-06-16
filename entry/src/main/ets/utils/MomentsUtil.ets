import dataPreferences from '@ohos.data.preferences';
import { Moment } from '../model/Moment';
import { GlobalContext } from './GlobalContext';

const TAG = '[PreferencesUtil]';
const PREFERENCES_NAME = 'myMoments';
const KEY_APP_MOMENTS = 'moments';

export class MomentsUtil {
  constructor() {
  }

  createWeatherInfo(context: Context) {
    let myMoments: Function = (() => {
      let info: Promise<dataPreferences.Preferences> = dataPreferences.getPreferences(context,
        PREFERENCES_NAME);
      return info;
    });
    GlobalContext.getContext().setObject('myMoments', myMoments);
  }

  cacheMoments(moments: any) {
    let getWeatherInfo: Function = GlobalContext.getContext().getObject('myMoments') as Function;
    getWeatherInfo().then(async (preferences: dataPreferences.Preferences) => {
      preferences.has(KEY_APP_MOMENTS).then(async (isExist) => {
        if (isExist) {
          console.log('exist moments', isExist)
          return;
        }
        const value = JSON.stringify(moments);
        await preferences.put(KEY_APP_MOMENTS, value);
        preferences.flush();
        console.log('moments put')
      })
        .catch((err) => {
          console.error(TAG, 'put the preferences failed, err: ' + err);
        })
    }).catch((err: Error) => {
      console.error(TAG, 'put the preferences failed, err: ' + err);
    });
  }

  async getExistMoments() {
    let existMoments = '[]';
    const getExistMoments: Function = GlobalContext.getContext().getObject('myMoments') as Function
    existMoments = await (await getExistMoments()).get(KEY_APP_MOMENTS, existMoments)
    console.log('moments', typeof existMoments)
    if (existMoments) {
      return JSON.parse(existMoments) as Moment[]
    }
    return existMoments;
  }

}

export default new MomentsUtil()