import UIKit

let image = URL(string: "https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=2369240232,1690328365&fm=26&gp=0.jpg")

let urlData = try Data(contentsOf:image!)    //将json数据转换为二进制数据

let fileManager = FileManager.default

var path = fileManager.urls(for: .documentDirectory, in:.userDomainMask).first!

path.appendPathComponent("zhangyixin.jpg")
print(path)
try urlData.write(to: path)
