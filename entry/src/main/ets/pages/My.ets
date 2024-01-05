import HeaderComponent from '../components/HeaderComponent'
import * as colors from '../theme/color'

@Entry
@Component
export default struct Choose {
  private scroller: Scroller = new Scroller()
  private textList: String[] = ['个人中心', '修改密码', '退出登录']

  @Builder contentComponent(title: string) {
    Row({ space: 10 }) {
      Image($r('app.media.icon'))
        .width(30)
        .height(30)
        .borderRadius(50)
      Text(title)
    }
    .margin({ top: 5 })
    .width('95%')
    .height(60)
    .backgroundColor('white')
    .borderRadius(10)
    .padding({ left: 10 })
    .justifyContent(FlexAlign.Start)
  }

  @Builder introduceComponent() {
    Row({ space: 10 }) {
      Image($r('app.media.icon'))
        .width(50)
        .height(50)
        .borderRadius(50)
      Text('fbk111')
    }
    .width('95%')
    .height(100)
    .backgroundColor('white')
    .borderRadius(10)
    .padding({ left: 10 })
    .justifyContent(FlexAlign.Start)
  }

  @Styles pageStyles(){
    .width('100%')
    .height('100%')
    .backgroundColor(colors.pageBackgroundColor)
  }

  build() {
    Column() {
      HeaderComponent({ title: '我的' })
      this.introduceComponent()
      Divider().width('100%').height(10).opacity(0)
      Column() {
        List() {
          ForEach(this.textList, (item) => {
            ListItem() {
              this.contentComponent(item)
            }
          }, item => item)
        }.width('95%')
      }.alignItems(HorizontalAlign.Center)
      .width('100%')
    }.pageStyles()
  }
}