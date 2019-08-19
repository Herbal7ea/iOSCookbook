//

import SwiftUI

struct RootView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: LegacyTextDateToolbarContainer()) {
                    Text("Text, Date, Toolbar")
                }.navigationBarTitle(Text("Navigation"))
                
                NavigationLink(destination: LegacyAlertViewContainer()) {
                    Text("Alert View Controller")
                }
                
                NavigationLink(destination: LegacyUIComponentsContainer()) {
                    Text("UI Components")
                }
            }
        }
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}

#endif
