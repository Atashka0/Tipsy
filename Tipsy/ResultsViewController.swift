

import UIKit

class ResultsViewController: UIViewController {
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    var tip : String = ""
    var people : Double = 0
    var result : Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = String(format: "%0.2f", result)
        settingsLabel.text = "Split between \(Int(people)) people, with \(tip) tip."
        // Do any additional setup after loading the view.
    }
    
    @IBAction func recalculatePressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

}
