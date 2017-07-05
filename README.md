AstraeaSwfit 是一套一对一视频聊天解决方案，采用Swift编写


- [功能简介](#功能简介)
- [系统需求](#系统需求)
- [集成](#集成)
- [使用](#使用)


## 功能简介
- [x] 获取可聊天的用户列表
- [x] 获取用户动态列表
- [x] 获取在线用户数
- [x] 夜间/白天 模式切换

## 系统需求
- iOS 8.0+

## 集成
采用[CocoaPods](http://cocoapods.org)
在Podfile中：
```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '8.0'
use_frameworks!

target '<Your Target Name>' do
    pod 'AstraeaSwift'
end
```
### 注意
框架内部依赖一些第三方框架，如果冲突可以适当进行删除和修改。

## 使用
### 初始化
在使用本框架前，需要先初始化
```
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    AppConfig.start(with: "userId")
    AppConfig.setAppConfigDelegate(delegate: self)
    return true
}
```
`start`方法可以带入当前App登录用户的UserId，以便后续使用
`AppConfigDelegate`可设置相关事件回调
### 用户绑定
在设置了`AppConfigDelegate`后，框架触发登录操作后，会调用
```
func requestLogin(from controller: UIViewController?) {
   let alert = UIAlertController(title: "是否转换为DUDU账户", message: nil, preferredStyle: .alert)
   let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)
   let confirmAction = UIAlertAction(title: "确定", style: .default) { (alert) in
       self.bindUser()
   }
   alert.addAction(cancelAction)
   alert.addAction(confirmAction)
   window?.rootViewController?.present(alert, animated: true, completion: nil)
}
```
在App内登录后，需要转换为视频聊天用户，调用框架接口进行绑定
```
func bindUser() {
    AppConfig.bindUser(
        userId: "test-123",
        mobile: "18618439364",
        nickname: "吸管",
        avatar: "http://tva3.sinaimg.cn/crop.0.7.1243.1243.180/71894349jw8fa9dof3ylej20yj0yxq5e.jpg",
        gender: 1) { (error) in
                
     }
 }
```
### 获取聊天用户列表
- 使用框架提供的界面
```
let anchorsVc = AnchorsViewController()
navigationController?.pushViewController(anchorsVc, animated: true)
```
![截图1]
- 使用框架提供的数据，需要自己定制页面
```
AppConfig.fetchActiveUsers { (users, error) in

}
```
