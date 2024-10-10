import SwiftUI

struct NoItemsView: View {
    
    @State var animate: Bool = false
    let secondaryAccentColor = Color("SecondaryAccentColor")
    
    var body: some View {
        ScrollView{
            VStack(spacing: 10){
                Image(systemName: "plus.app")
                    .resizable()
                    .scaledToFill()
                    .foregroundColor(Color.accentColor)
                    .frame(width: 200 , height: 200)
                    .padding(.bottom, 20)

                Text("There is no items")
                    .font(.title)
                    .fontWeight(.semibold)
                Text("Are you a productive person? I think you should click the add button and add a bunch of items to your Todo list!")
                    .padding(.bottom,20)
                NavigationLink {
                    AddView()
                } label: {
                    Text("Add something 🥳")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(animate ? secondaryAccentColor : Color.accentColor)
                        .cornerRadius(10)
                }
                .padding(.horizontal,animate ? 30 :50)
                .shadow(
                    color: animate ? secondaryAccentColor.opacity(0.5) : Color.accentColor.opacity(0.5),
                    radius: animate ? 30 : 10 ,
                    x: 0 ,
                    y: animate ? 20 : 10)
                .scaleEffect(animate ? 1.1 : 1)
                .offset(y: animate ? -7 : 0)
            }
            .multilineTextAlignment(.center)
            .padding(40)
            .onAppear(perform: addAnimation)
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity)
    }
    
    func addAnimation(){
        guard !animate else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(.easeInOut.delay(2.0).repeatForever()){
                animate = true
            }
            
        }
    }
}

struct NoItemsViewPreview : PreviewProvider{
    static var previews: some View{
        NavigationView{
            NoItemsView().navigationTitle("Title")
        }
    }
}
