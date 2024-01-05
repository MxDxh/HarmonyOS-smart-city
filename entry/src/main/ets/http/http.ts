import axios from '@ohos/axios'
import http from '@ohos.net.http'
import { HOST } from './constant'
import PreferenceUtil from '../utils/PreferenceUtils'
export default async function request(method: http.RequestMethod, url: string, data?: {}, header?: {}) {
  // return new Promise(async (resolve,reject)=>{
  //   axios.request({
  //     method:method,
  //     url:HOST+url,
  //     data:data||{},
  //     headers:header||{
  //       'Authorization':await PreferenceUtil.getPreferenceValue('myPreferences','token','') as string
  //     }
  //   }).then(res=>{
  //     console.log('demo1'+res.data)
  //     resolve(res.data)
  //   }).catch(error=>{
  //     reject(error)
  //   })
  // })
  return await axios.request({
    method: method,
    url: HOST + url,
    data: data || {},
    headers: header || {
      'Authorization': 'eyJhbGciOiJIUzUxMiJ9.eyJsb2dpbl91c2VyX2tleSI6ImY4ODc3ZmI5LTVhODQtNGI4Mi1iN2MyLWU2YTQxMjNmNTU0NSJ9.tnrFl0UtZTmxsAX9k7sfbJJKLcTKSfYSL6YONxenGwhNaA7-Uy-XvJOBxqqaxSmvmPT4ditJDXMmdJdoTYAB9Q'
    }
  })
}