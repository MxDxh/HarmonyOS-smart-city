// import http from '@ohos.net.http';
import http from '@ohos.net.http';
// import api from './api';
import request from './http';
export async function login(username: string, password: String){
     return await request(http.RequestMethod.POST,'/login',{username,password},{})
}
export async function getSwiper(){
     return await request(http.RequestMethod.GET,'/system/homePageRotation/list')
}