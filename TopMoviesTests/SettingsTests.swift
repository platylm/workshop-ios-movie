import XCTest
@testable import TopMovies

class SettingsTests: XCTestCase {
    
    func settingsViewController() -> SettingsViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "Settings") as! SettingsViewController
        _ = vc.view
        return vc
    }
    
    func test_title_is_Settings(){
        let vcSettings = settingsViewController()
        XCTAssertEqual("Settings",vcSettings.navigationItem.title)
    }
    
    func test_label_is_Number_of_results_to_display(){
        let vcSettings = settingsViewController()
        XCTAssertEqual("Number of results to display", vcSettings.label.text)
    }
    
    func test_result_number(){
        let vcSettings = settingsViewController()
        XCTAssertEqual("50", vcSettings.number.placeholder)
    }
    
    func test_valid_with_input_10(){
        let vcSettings = settingsViewController()
        vcSettings.enterText("10")
        XCTAssertTrue(vcSettings.error.isHidden)
    }
    
    func test_valid_with_input_200(){
        let vcSettings = settingsViewController()
        vcSettings.enterText("200")
        XCTAssertTrue(vcSettings.error.isHidden)
    }
    
    func test_valid_with_input_1(){
        let vcSettings = settingsViewController()
        vcSettings.enterText("1")
        XCTAssertFalse(vcSettings.error.isHidden)
    }
    
    func test_valid_with_input_201(){
        let vcSettings = settingsViewController()
        vcSettings.enterText("201")
        XCTAssertFalse(vcSettings.error.isHidden)
    }
    
    func test_valid_with_input_x2(){
        let vcSettings = settingsViewController()
        vcSettings.enterText("x2")
        XCTAssertFalse(vcSettings.error.isHidden)
    }
    
    func test_valid_with_input_empty_string(){
        let vcSettings = settingsViewController()
        vcSettings.enterText("")
        XCTAssertTrue(vcSettings.error.isHidden)
    }
}

extension SettingsViewController {
    func enterText(_ text: String) {
        _ = textField(number, shouldChangeCharactersIn: NSRange(location: number.text!.count, length: 0), replacementString: text)
    }
}
