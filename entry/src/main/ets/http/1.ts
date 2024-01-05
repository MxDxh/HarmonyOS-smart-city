import http from '@ohos.net.http';
import router from '@ohos.router';
import {HOST} from '../http/constant';

interface ReturnData{
  msg:string
  code:number
  data:any
}
class HttpRequest {
  private static instance: HttpRequest;
  private token: string;

  private constructor() {
  }

  public setToken(token: string) {
    this.token = token;
  }

  public static getInstance(): HttpRequest {
    if (!this.instance) {
      this.instance = new HttpRequest()
    }
    return this.instance
  }

  public request(url:string,options:http.HttpRequestOptions): Promise<any> {
    const defaultOptions:http.HttpRequestOptions={
      extraData:null,
      method:http.RequestMethod.GET,
      connectTimeout:10000,
      readTimeout:10000,
      header:{
        "content-type":"application/json",
        "Authorization":this.token
      }
    }
    options={...defaultOptions,...options}
    let httpRequest=http.createHttp()
    return new Promise((resolve, reject) => {
      httpRequest.request(HOST+url,options).then((res:http.HttpResponse)=>{
        console.log('demo',res.result.toString());
        // console.log('请求的结果是',res.result);
        // const result:ReturnData=JSON.parse(res.result.toString()) as ReturnData
        // if(result.code==401){
        //   router.pushUrl({url:'/pages/login'})
        // }else{
        //   resolve(result)
        // }
      }).catch((err:Error)=>{
          console.log('错误的地方'+err.message)
      }).finally(()=>{
        httpRequest.destroy()
      })
    })


  }
}

export default HttpRequest.getInstance()