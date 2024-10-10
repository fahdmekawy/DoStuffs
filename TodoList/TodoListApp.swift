import SwiftUI



/*
 
 MVVM Architecture
 Model - data point
 View - UI
 View Model - manage Model For View
 
 */


@main
struct TodoListApp: App {
    var body: some Scene {
        @StateObject var listViewModel : ListViewModel = ListViewModel()
        WindowGroup {
            NavigationView{
                ListView()
            }.environmentObject(listViewModel)
        }
    }
}
