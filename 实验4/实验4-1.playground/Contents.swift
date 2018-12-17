import UIKit


let fileManager = FileManager.default
let docPath = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first?.path

var file = docPath?.appending("/Lixuan")
if fileManager.fileExists(atPath: file!) {
    let image = file?.appending("/zyx.jpg")
    if fileManager.fileExists(atPath: image!){
        print("存在")
    }
    else{
        let url = URL(string:"https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=2369240232,1690328365&fm=26&gp=0.jpg")
        let data = try Data(contentsOf: url!)
        try data.write(to:URL(fileURLWithPath: image!),options: .atomicWrite)
    }
}
else{
    try fileManager.createDirectory(atPath: file!, withIntermediateDirectories: true, attributes: nil)
    print("文件不存在，创建文件")
}

