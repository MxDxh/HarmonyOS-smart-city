import router from '@ohos.router';
import hilog from '@ohos.hilog';
import HeaderComponent from '../components/HeaderComponent'
import { getSwiper } from '../http/service';
import * as colors from '../theme/color';
import * as size from '../theme/size';
import NewsItemComponent from '../components/NewsItemComponent'
import {newsList} from '../base/allData'
@Component
@Entry
export default struct Home {
  @State swiperList: Array<any> = []
  private swiperController: SwiperController = new SwiperController()

  aboutToAppear() {
    this.getSwiperList()
  }

  async getSwiperList() {
    let data = await getSwiper()
    this.swiperList = data.data.rows
    hilog.info(0x0000, 'testTag11111', '%{public}s', data.data);
  }

  private scroller: Scroller = new Scroller()

  build() {
    Column() {
      HeaderComponent({ title: '首页' })
      Scroll(this.scroller) {
        Column(){
          Swiper(this.swiperController) {
            Image($r('app.media.swiper1'))
              .width('100%')
              .height(50)
            Image($r('app.media.swiper2'))
              .width('100%')
              .height(50)
            Image($r('app.media.swiper3'))
              .width('100%')
              .height(50)
          }.width('98%')
          .height(145)
          .borderRadius(10)
          GridList()
           Column(){
             ForEach(newsList.rows,(item,index)=>{
               NewsItemComponent({imgUrl:item.cover,title:item.title,content:item.content,date:item.publishDate})
             },item=>item)
           }
          .width('100%')
        }
      }.scrollable(ScrollDirection.Vertical)
    }.width('100%')
    .height('100%')
    .backgroundColor(colors.pageBackgroundColor)
  }
}


@Component
export struct GridList {
  private girdList = [{
    icon: $r('app.media.index'),
    name: 'demo1'
  },
    {
      icon: $r('app.media.index'),
      name: 'demo1'
    }, {
      icon: $r('app.media.index_choose'),
      name: 'demo2'
    },
    {
      icon: $r('app.media.category'),
      name: 'demo3'
    },
    {
      icon: $r('app.media.category_choose'),
      name: 'demo4'
    }, {
      icon: $r('app.media.choose'),
      name: 'demo5'
    }, {
      icon: $r('app.media.choose_choose'),
      name: 'demo6'
    },
    {
      icon: $r('app.media.my'),
      name: 'demo7'
    },
    {
      icon: $r('app.media.my_choose'),
      name: 'demo8'
    }, {
      icon: $r('app.media.choose'),
      name: 'demo9'
    },]

  build() {
    Grid(){
      ForEach(this.girdList,(item)=>{
        GridItem(){
          Column(){
            Image(item.icon)
              .width(30)
              .height(30)
            Text(item.name)
          }
          .height('100%')
          .width('100%')
        }
      })

    }
    .columnsTemplate('1fr 1fr 1fr 1fr 1fr')
    .rowsTemplate('1fr 1fr')
    .maxCount(2)
    .columnsGap(10)
    .width('100%')
    .height(130)
    .align(Alignment.Center)
    .margin({top:10})
  }
}