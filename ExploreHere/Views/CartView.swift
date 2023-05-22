import SwiftUI

struct CartView: View {
    
    @State private var showThankYouView = false
    @EnvironmentObject var tripType : TripType
    @EnvironmentObject var hotelType : HotelType
    
    var body: some View {
        VStack(alignment: .leading){
            Text("Cart")
                .font(.largeTitle).bold()
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            ScrollView{
                
                if tripType.activities.count > 0 {
                    ForEach(tripType.activities, id: \.id) {
                        activities in
                        ItemRows(activity: activities)
                    }
                }
                else {
                    Text("Your cart is empty!")
                        .padding()
                }
                
                Text("Total price is")
                Spacer()
                Text("$\(tripType.total)")
                PaymentButtonView(action: {
                    showThankYouView = true
                })
                .padding()
                .fullScreenCover(isPresented: $showThankYouView) {
                    ThankYouView(totalPrice: Double(tripType.total))
                }
            }
        }
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
            .environmentObject(TripType())
            .environmentObject(HotelType())
    }
}

