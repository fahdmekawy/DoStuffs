import Foundation


/*
 CRUD FUNCTIONS
 
 CREATE
 READ
 DELETE
 UPDATE
 
 */

class ListViewModel : ObservableObject{
    @Published var items: [ItemModel] = []{
        didSet{
            saveItems()
        }
    }
    let itemsKey : String = "items_key"
    
    init() {
        getItem()
    }
    
    func getItem(){
        guard 
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let savedItems = try? JSONDecoder().decode([ItemModel].self, from: data)
        else { return }
        
        self.items = savedItems
    }
    
    func deleteItem(index: IndexSet){
        items.remove(atOffsets: index)
    }
    
    func moveItem(from: IndexSet , to: Int){
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(title: String){
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
    }
    
    func updateItem(item: ItemModel){
        if let index = items.firstIndex(where: { $0.id == item.id}){
            items[index] = item.updateCompeletion()
        }
    }
    
    func saveItems(){
        if let encodedData = try? JSONEncoder().encode(items){
            UserDefaults.standard.set(encodedData, forKey: itemsKey)
        }
    }
}
