
import SwiftUI

struct IconView: View {
    @Binding var IconViewIsShowing : Bool
    var body: some View {
        Text("Hello!")
    }
}

struct IconView_Previews: PreviewProvider {
    private static var IconViewIsShowing = Binding.constant(false)
    static var previews: some View {
        IconView(IconViewIsShowing: IconViewIsShowing)
    }
}
