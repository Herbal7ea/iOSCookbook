import Foundation

enum CustomError: Error {
    case network,
         invalidData
}

class ErrorExploration {
    static func runExample() {
        do {
            try parseNetworkData()
        } catch is CustomError {
            print("🧛🏻‍♂️ e'please e'deal weeth e'your' errorz.  ah ah ah.")
        } catch {
            print("🧟‍♂️ something totally unexpected")
        }
    }
    
    static func parseNetworkData() throws {
        //faking error
        throw CustomError.invalidData
    }
}
