import Foundation



// immutable struct
struct ItemModel : Identifiable , Codable {
    let id : String
    let isCompleted : Bool
    let title : String
    
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool) {
        self.title = title
        self.isCompleted = isCompleted
        self.id = id
    }
    
    func updateCompeletion()-> ItemModel{
        return ItemModel(id: id, title: title, isCompleted: !isCompleted)
    }
    
}
