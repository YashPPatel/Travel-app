
import SwiftUI

struct ContentView: View {
    @EnvironmentObject var tripType : TripType
    @State private var ListScreenIsShowing = false
    @State private var selection = 1
    @AppStorage("ifSucceed") var ifSucceed:Bool = false
    
    
    var body: some View {
        VStack{
            if !ifSucceed {
                LoginView()
            }else{
                TabView(selection:$selection){
                 
                    Homescreen()
                        .tabItem {
                            Image(systemName: "house")
                            Text("Home")
                                .fontWeight(.black)
                        }
                        .tag(3)
                    ListScreen(ListScreenisShowing: $ListScreenIsShowing)
                        .tabItem{
                            Image(systemName: "bed.double")
                                .resizable()
                            Text("Hotel")
                        }
                        .tag(0)
                    PlanTripView()
                        .environmentObject(tripType)
                      
                        .tabItem {
                            Image(systemName:"figure.walk")
                                .resizable()
                            Text ("Activities")
                        }
                        
                        .tag(1)
                    CartView()
                 
                        .tabItem{
                            CartButton(numberOfItems: 0)
                            Text ("Cart")
                                
                        }
                        .badge(tripType.activities.count)
                    
                        
                }
                .accentColor(.blue)
            }
        }
      
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView()
            .environmentObject(TripType())
            
    }
}
