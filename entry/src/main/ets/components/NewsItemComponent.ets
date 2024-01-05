import router from '@ohos.router'
import { HOST } from '../http/constant'
@Component
export default struct NewsItemComponent {
  imgUrl: string
  title: string
  content:string
  date:string
  build() {
    Row({ space: 20 }) {
      Image(HOST+this.imgUrl)
        .width(80)
        .height(50)
      Column({space:10}){
        Text(this.title)
          .maxLines(1)
          .textOverflow({overflow:TextOverflow.Ellipsis})
        Text(this.content)
          .maxLines(2)
          .textOverflow({overflow:TextOverflow.Ellipsis})
          Text(this.date)
      }
    }
    .onClick(item=>{
      router.pushUrl({url:'../pages/Detail',params:{data:''}},router.RouterMode.Single,(err)=> {
        if (err) {
          console.error(`Invoke showAlertBeforeBackPage failed, code is ${err.code}, message is ${err.message}`);
        }
      })
    })
    .width('100%')
    .margin({bottom:10})
    .justifyContent(FlexAlign.Start)
  }
}