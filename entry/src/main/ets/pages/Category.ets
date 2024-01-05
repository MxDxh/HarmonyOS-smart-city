import router from '@ohos.router'
import HashMap from '@ohos.util.HashMap'
import hilog from '@ohos.hilog'
import { categoryList } from '../base/allData'
import HeaderComponent from '../components/HeaderComponent'
import { HOST } from '../http/constant'

@Entry
@Component
export default struct Category {
  private categoryMap ={}
  @State private current:string="全部服务"
  aboutToAppear() {
    this.categoryMap = categoryList.rows.reduce((reg,current)=>{
      let {serviceType}=current
      if(reg[serviceType]){
        reg[serviceType].push(current)
      }else{
        reg[serviceType]=[]
      }
      return reg
    },{
      "全部服务":categoryList.rows
    })
    console.log(JSON.stringify(this.categoryMap))

  }

  build() {
    // HeaderComponent({title:"全部服务"})
    Flex() {
      Column() {
         ForEach(Object.keys(this.categoryMap),(item,index)=>{
             Text(item=="null"?"其他服务":item)
               .width('100%')
               .height(50)
               .backgroundColor(this.current==item?"#1ff1ff":"")
               .onClick(value=>{
                 this.current=item
               })
         },item=>item)
      }
      .width(100)
      .height('100%')
      Grid(){
        ForEach(this.categoryMap[this.current],item=>{
          GridItem(){
            Column(){
              Image(HOST+item.imgUrl)
                .width(30)
                .height(30)
                .borderRadius(30)
              Text(item.serviceName)
                .maxLines(1)
            }
          }
        },item=>item)
      }
      .columnsTemplate('1fr 1fr 1fr 1fr')
    }
    .height('100%')
  }
}