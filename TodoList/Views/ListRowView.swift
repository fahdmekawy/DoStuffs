
import SwiftUI

struct ListRowView: View {
    let item: ItemModel
    var body: some View {
        HStack{
            Image(systemName: item.isCompleted == true ? "checkmark.circle" : "circle")
                .foregroundColor(item.isCompleted == true ? .green : .red)
            Text(item.title).strikethrough(item.isCompleted == true ? true : false, color: .red)
            Spacer()
        }
        .font(.title2)
        .padding(.vertical,8)
    }
}

struct ListRowItemPreview: PreviewProvider{
   
    static var item1 = ItemModel(title: "First item", isCompleted: false)
    static var item2 = ItemModel(title: "Second item", isCompleted: true)


    static var previews: some View{
        Group{
            ListRowView(item: item1)
            ListRowView(item: item2)
        }.previewLayout(.sizeThatFits)
    }

}
