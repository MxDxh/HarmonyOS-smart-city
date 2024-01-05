// 反例： @Styles不支持参数
@Extend(Column) function globalFancy() {
  .width('98%')
  .backgroundColor('#f9f9f9')
  .alignItems(HorizontalAlign.Center)
}

export {
  globalFancy
}
