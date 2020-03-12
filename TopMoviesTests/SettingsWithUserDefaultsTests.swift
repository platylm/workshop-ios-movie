import XCTest
@testable import TopMovies

class SettingsWithUserDefaultsTests: XCTestCase {
    
    func settingsViewController() -> SettingsViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "Settings") as! SettingsViewController
        _ = vc.view
        return vc
    }

    func test_save_number_from_UserDefaults(){
        let vcSettings = settingsViewController()
        let defaults = FakeUserDefaults()
        vcSettings.userDefaults = defaults
        vcSettings.enterText("2")
        XCTAssertEqual(2, defaults.value(forKey: UserDefaultsKeys.numberOfResults.rawValue)as! Int)
    }
    
    func test_remove_number_from_UserDefaults(){
        let vcSettings = settingsViewController()
        let defaults = FakeUserDefaults()
        vcSettings.userDefaults = defaults
        vcSettings.enterText("")
        XCTAssertNil(defaults.value(forKey: UserDefaultsKeys.numberOfResults.rawValue))
    }
    
    func test_save_and_remove_number_from_UserDefaults(){
        let vcSettings = settingsViewController()
        let defaults = FakeUserDefaults()
        vcSettings.userDefaults = defaults
        
        vcSettings.enterText("2")
        XCTAssertEqual(2, defaults.value(forKey: UserDefaultsKeys.numberOfResults.rawValue)as! Int)
        
        vcSettings.number.text = ""
        vcSettings.enterText("")
        XCTAssertNil(defaults.value(forKey: UserDefaultsKeys.numberOfResults.rawValue))
    }

}

class FakeUserDefaults: UserDefaults {
    var store = [String: Any?]()
    
    override func setValue(_ value: Any?, forKey key: String) {
        store[key] = value
    }
    
    override func value(forKey key: String) -> Any? {
        if let value = store[key] {
            return value
        }
        return nil
    }
}
