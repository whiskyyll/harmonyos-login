export interface IWorkTarget {
  target: string,
  updatedTime: string,
  progress: number
}

export interface IOverallTargets {
  period?: string,
  target?: string,
  updatedTime?: string,
  progress?: number
}