# video-player
iOS App

# Setup Instructions

1. Download xcode 10 (App currently runs on Swift 4.2)
2. Install cocoapods `https://cocoapods.org/#install`
3. git clone this repo
4. In the terminal, cd into this repo and enter `pod install`
5. Open the project from the newly created `workspace` file. 
6. Get the `Keys.swift` file from a teammate or change `KeysTemp` to `Keys` and insert valid Keys


## The video-player app follows standard Xcode MVC folder structure.
## It is as follows.

- CoreData : Contains DataModel and Entity Classes.
- Extensions : Contain One class(default apple class extensions+project class extensions.)
- Helper: Contain Third Party classes/Frameworks (eg. SWRevealController) + Bridging classes (eg. Obj C class in Swift based project)
- Model : Make a singleton class (eg.AppModel - NSArray,NSDictionary, String etc.) for saving data. The Web Service Response parsing and storing data is also done here.
- Services : Contain Web Service processes (eg. Login Verification, HTTP Request/Response)
- View : Contain storyboard, LaunchScreen.XIB and View Classes. Make a sub folder Cells - contain UITableViewCell, UICollectionViewCell etc.
- Controller: Contain Logic or Code related to UIElements (eg. UIButton’s reference+ clicked action)
