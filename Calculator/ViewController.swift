import UIKit

class ViewController: UIViewController {
    
    var numberShown: Double = 0
    var previusNumberShown: Double = 0
    var doingMath = false
    var operation = 0
    
    @IBOutlet weak var label: UILabel!
    
    @IBAction func numbers(_ sender: UIButton) {
        if doingMath == true {
            label.text = String(sender.tag - 1)
            numberShown = Double(label.text!)!
            doingMath = false
        } else {
            label.text = label.text! + String(sender.tag - 1)
            numberShown = Double(label.text!)!
        }
    }
    
    
    @IBAction func options(_ sender: UIButton) {
        if label.text != "" && sender.tag != 11 && sender.tag != 16 && sender.tag != 18{ //if not C or =
            previusNumberShown = Double(label.text!)!
            
            switch sender.tag {
            case 12:    // /
                label.text = "/";
            case 13:    // X
                label.text = "X";
            case 14:    // -
                label.text = "-";
            case 15:    // +
                label.text = "+";
            case 17:
                label.text = "^";
            default:
                label.text = "";
            }
            
            operation = sender.tag
            doingMath = true
        }
        else if sender.tag == 16 && sender.tag != 18 { // =
            switch operation {
            case 12:
                label.text = String(previusNumberShown / numberShown)
            case 13:
                label.text = String(previusNumberShown * numberShown)
            case 14:
                label.text = String(previusNumberShown - numberShown)
            case 15:
                label.text = String(previusNumberShown + numberShown)
            case 17:
                label.text = String(pow(previusNumberShown, numberShown))
            default:
                label.text = ""
            }
        }
        else if sender.tag == 11 {
            label.text = ""
            previusNumberShown = 0
            numberShown = 0
            operation = 0
        }
        else if sender.tag == 18 {
            label.text = String(sqrt(numberShown))
            doingMath = true
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

