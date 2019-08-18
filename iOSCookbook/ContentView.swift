//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: LegacyViewControllerContainer()) {
                    Text("LegacyViewController")
                }.navigationBarTitle(Text("Navigation"))
            }
        }
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

#endif
