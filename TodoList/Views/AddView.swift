import SwiftUI

struct AddView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel : ListViewModel
    @State var textFieldText: String = ""
    @State var alertTitle : String = ""
    @State var showAlert : Bool = false
    
    var body: some View {
        ScrollView{
            VStack {
                TextField("Type something here ... ", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(#colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)))
                    .cornerRadius(10).padding(.bottom, 30)
                
                Button(
                    action: saveButtonPressed,label: {
                        Text("Save".uppercased())
                            .foregroundColor(.white)
                            .font(.headline)
                            .frame(height: 55)
                            .frame(maxWidth: .infinity)
                            .background(Color.accentColor).cornerRadius(12)
                    })
                
            }.padding(16)
            
        }
        .navigationTitle("Add an Item 🖋️")
        .alert(isPresented: $showAlert,content: getAlert)
    }
    
    func saveButtonPressed(){
        if textIsAppropriate(){
            listViewModel.addItem(title: textFieldText)
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    func textIsAppropriate() -> Bool{
        if textFieldText.count < 3 {
            showAlert.toggle()
            alertTitle = " Your new item must be at least 3 Characters long!! 😕"
            return false
        }

        return true
    }
    
    func getAlert() -> Alert{
        return Alert(
            title: Text(alertTitle))
    }
}

#Preview {
    NavigationView{
        AddView()
    }.environmentObject(ListViewModel())
}
