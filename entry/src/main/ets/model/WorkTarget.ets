@Observed
export class  WorkTarget {
  target: string;
  updatedTime: string;
  progress: number;
  completed?: boolean;
  selected?: boolean
  canBeSelect?: boolean

  constructor(target: string, updatedTime: string, progress: number) {
    this.target = target;
    this.updatedTime = updatedTime;
    this.progress = progress;
  }
}