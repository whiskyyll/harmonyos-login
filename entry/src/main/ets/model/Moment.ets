import { UserInfo } from './UserInfo';

@Observed
export class Moment {
  content?: string;
  images?: { url: string }[];
  sender: UserInfo;
  comments?: Moment[]
  error?: string;
}