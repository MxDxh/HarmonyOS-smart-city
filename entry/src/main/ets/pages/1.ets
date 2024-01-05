import router from '@ohos.router'
@Entry
@Component
struct Index {
  @State fontColor: string='#182431'
  @State selectedFontColor: string = '#007DFF'
  @State currentIndex: number = 0
  private tabController:TabsController=new TabsController()
  @Builder TabsBuilder(index:number,name:string){
    Column() {
      Text(name)
        .fontColor(this.currentIndex === index ? this.selectedFontColor : this.fontColor)
        .fontSize(16)
        .fontWeight(this.currentIndex === index ? 500 : 400)
        .lineHeight(22)
        .margin({ top: 17, bottom: 7 })
      Divider()
        .strokeWidth(2)
        .color('#007DFF')
        .opacity(this.currentIndex === index ? 1 : 0)
    }.width('100%')
  }
  build() {
    Column(){
      Tabs({barPosition:BarPosition.End,controller:this.tabController}){
        TabContent(){
          Column(){
            Button('点击跳转')
              .onClick(()=>{
                console.log('check me')
                router.pushUrl({url:'/pages/login'},router.RouterMode.Single,(err)=>{
                  if(err){
                    console.error(`Invoke showAlertBeforeBackPage failed, code is ${err.code}, message is ${err.message}`);
                  }
                })
              })
          }.width('100%').height('100%').backgroundColor('#00CB87')
        }.tabBar(this.TabsBuilder(0,'green'))
        TabContent(){
          Column().width('100%').height('100%').backgroundColor('#00CB87')
        }.tabBar(this.TabsBuilder(1,'green'))
        TabContent(){
          Column().width('100%').height('100%').backgroundColor('#00CB87')
        }.tabBar(this.TabsBuilder(2,'green'))
        TabContent(){
          Column().width('100%').height('100%').backgroundColor('#00CB87')
        }.tabBar(this.TabsBuilder(3,'green'))
      }
      .onChange((index:number)=>{
        this.currentIndex=index
      })
      .backgroundColor('black')
    }
  }
}