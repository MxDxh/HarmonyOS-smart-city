
@Component
export default struct HeaderComponent {
  @Prop title:string;
  build() {
    Row(){
      Text(this.title)
        .fontWeight(FontWeight.Bold)
        .fontSize(20)
    }.justifyContent(FlexAlign.Center)
    .width('100%')
    .height(50)
    .backgroundColor('white')
    .margin({bottom:10})
  }
}