import Category from './Category';
import Choose from './Choose';
import Home from './Home';
import My from './My';
@Entry
@Component
struct Index {
  private tabController: TabsController = new TabsController()
  @State currentIndex:number=0
  nagivatorIcon(index: number) {
    switch (index) {
      case 0:
        return ''
        break;

      default:
        break;
    }
  }

  @Builder TabBuilder(name: string, targetIndex: number,resourceImg:ResourceStr,selectImg:ResourceStr) {
    Column({ space: 6 }) {
      Image(this.currentIndex==targetIndex?selectImg:resourceImg)
        .size({width:30,height:30})
      Text(name)
        .fontColor(this.currentIndex === targetIndex ? '#5DA0FF' : '#999999')
    }.onClick(value=>{
      this.currentIndex=targetIndex
      this.tabController.changeIndex(this.currentIndex)
    })
  }

  build() {
    Tabs({ barPosition: BarPosition.End, controller: this.tabController }) {
      TabContent() {
         Home()
      }.tabBar(this.TabBuilder('首页',0,$r('app.media.index'),$r('app.media.index_choose')))
      TabContent() {
         Category()
      }.tabBar(this.TabBuilder('分类',1,$r('app.media.category'),$r('app.media.category_choose')))
      TabContent() {
         Choose()
      }.tabBar(this.TabBuilder('智慧党建',2,$r('app.media.choose'),$r('app.media.choose_choose')))
      TabContent() {
        My()
      }.tabBar(this.TabBuilder('我的',3,$r('app.media.my'),$r('app.media.my_choose')))
    }.onChange(value=>this.currentIndex=value)
    .backgroundColor('#f9f9f9')
  }
}