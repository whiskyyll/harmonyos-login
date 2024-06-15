export interface WeatherResponse {
  id: number
  coord: ICoord;
  weather: IWeather[];
  base: string;
  main: IWeatherDetail;
  wind: IWind;
  clouds: ICloud;
  name: string;
  cod: number;
  visibility: number;
  dt: number;
  timezone: number;
  sys: ISys
}

export interface LatestWeatherResponse {
  weather: IWeather[];
  main: IWeatherDetail;
  wind: IWind;
  clouds: ICloud;
  visibility: number;
  dt: number;
  sys: ISys
  pop: number;
  dt_txt: string;
}

export interface ICoord {
  lon: number;
  lat: number;
}

export interface IWeather {
  id: number;
  main: string;
  description: string;
  icon: string;
}

export interface  IWeatherDetail {
  temp: number;
  feels_like: number;
  temp_min: number;
  temp_max: number;
  pressure: number;
  humidity: number;
  sea_level?: number;
  grnd_level?: number;
  temp_kf?: number;
}

export interface IWind {
  speed: number;
  deg: number;
  gust?: number;
}

export interface ICloud {
  all: number;
}

export interface ISys {
  type?: number;
  id?: number;
  sunrise?: number;
  sunset?: number;
  country?: string;
  pod?: string;
}