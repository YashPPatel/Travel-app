
import SwiftUI

@main
struct ExploreHereApp: App {
    @StateObject private var tripTide = TripType()
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(tripTide)
        }
    }
}
