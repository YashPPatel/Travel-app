
import SwiftUI

struct ThankYouView: View {
    var totalPrice: Double
    
    var body: some View {
        VStack {
            Spacer()
            
            Text("Thank you")
                .font(.largeTitle)
                .padding()
                .foregroundColor(.blue) // Change text color to blue
            
            Text("Total price is")
                .font(.title)
                .foregroundColor(.gray) // Change text color to gray
            
            Text("$\(totalPrice)")
                .font(.title)
                .fontWeight(.bold)
            
            Spacer()
        }
        .background(Color.white) // Set background color to white
        .edgesIgnoringSafeArea(.all) // Ignore safe area edges
    }

}

struct ThankYouView_Previews: PreviewProvider {
    static var previews: some View {
        ThankYouView(totalPrice: 99.99)
    }
}


