export interface WorkTarget {
  target: string,
  updatedTime: string,
  progress: number,
  completed?: boolean,
  selected?: boolean
  canBeSelect?: boolean
}

export interface IOverallTargets {
  period?: string,
  target?: string,
  updatedTime?: string,
  progress?: number
}

export interface ITargetStatistics {
  completed: number,
  total: number
}

export class RouterParams {
  workTargetList: WorkTarget[]
  overallTarget: IOverallTargets
  constructor(v1:WorkTarget[], v2:IOverallTargets) {
    this.workTargetList = v1
    this.overallTarget = v2;
  }
}