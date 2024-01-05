import http from '@ohos.net.http'
import Response from '../http/Response'
import PreferenceUtil from '../utils/PreferenceUtils'
import { login } from '../http/service'
import router from '@ohos.router'
@Extend(Column) function globalFancy() {
  .width('100%')
  .height('100%')
  .backgroundColor('#f9f9f9')
  .alignItems(HorizontalAlign.Center)
}
@Entry
@Component
struct Login {
  @State username:string="fbk111"
  @State password:string="123456"
  async build() {
    Column(){
      Column(){
        Text('smart-city')
          .margin({bottom:70})
          .fontSize(30)
          .fontWeight(FontWeight.Bold)
        TextInput({text:this.username,placeholder:"请输入用户名"}).type(InputType.Normal)
          .margin({bottom:20})
          .onChange(value=>this.username=value)
        TextInput({text:this.password,placeholder:"请输入密码"}).type(InputType.Password)
          .margin({bottom:20})
          .onChange(value=>this.password=value)
        Button('登陆')
          .width('65%')
          .onClick(async ()=>{
            let promise=await login(this.username,this.password)
            console.log('请求'+promise);
            await PreferenceUtil.putPreferenceValue('myPreferences','token',promise.data.token as string)
            // let token=await PreferenceUtil.getPreferenceValue('myPreferences','token','')
            // console.log(token.toString());
            router.pushUrl({url:'pages/index'},router.RouterMode.Single,(err)=> {
              if (err) {
                console.error(`Invoke showAlertBeforeBackPage failed, code is ${err.code}, message is ${err.message}`);
              }
            })
          })
      }.width('90%')
      .margin({top:'60%'})
    }.globalFancy()

  }
}