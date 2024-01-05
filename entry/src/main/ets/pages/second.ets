class MyDataSource implements IDataSource {
  private list: number[] = []
  private Listener: DataChangeListener

  constructor(list: number[]) {
    this.list = list
  }

  totalCount() {
    return this.list.length
  }

  getData(index: number) {
    return this.list[index]
  }

  registerDataChangeListener(listener: DataChangeListener): void {
    this.Listener = listener
  }

  unregisterDataChangeListener() {

  }
}

@Entry
@Component
struct Second {
  private swiperController: SwiperController = new SwiperController()
  private data: MyDataSource = new MyDataSource([])

  aboutToAppear(): void {
    let list = []
    for (var i = 1; i <= 10; i++) {
      list.push(i.toString());
    }
    this.data = new MyDataSource(list)
  }

  build() {
    Column({ space: 5 }) {
      Swiper(this.swiperController) {
        LazyForEach(this.data, (item: string) => {
          Text(item)
            .width('90%')
            .height(160)
            .backgroundColor(0xAFEEEE)
            .textAlign(TextAlign.Center)
            .fontSize(30)
        }, item => item)
      }
    }

  }
}