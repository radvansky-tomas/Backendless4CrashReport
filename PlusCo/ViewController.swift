 import UIKit
 
 class ViewController: UIViewController {
    
    let APPLICATION_ID = "02E0B487-71CE-DB1E-FF7F-79892D128500"
    let API_KEY = "11FB143C-E216-C61D-FFF2-EFA9D4DB9B00"
    let SERVER_URL = "https://api.backendless.com"
    let backendless = Backendless.sharedInstance()!
    
    @IBOutlet weak var msgTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        backendless.hostURL = SERVER_URL
        backendless.initApp(APPLICATION_ID, apiKey: API_KEY)
        
        let subOptions:SubscriptionOptions = SubscriptionOptions()
        //subOptions.deliveryMethod(DELIVERY_POLL)
        Backendless.sharedInstance().messaging.subscribe("CHN-626EC44A-5DAA-3B34-FFB0-A733BB011A00", subscriptionResponse: { (messages:[Message]?) in
            print(messages)
        }, subscriptionError: { (error:Fault?) in
            print(error?.message != nil ? error!.message : "")
        }, subscriptionOptions: subOptions, response: { (sub:BESubscription?) in
            print(sub)
        }, error: { (error:Fault?) in
            print(error?.message != nil ? error!.message : "")
        })
        
    }
    
    @IBAction func sendClicked(_ sender: Any) {
        if let msgText:String = self.msgTextField.text
        {
            self.sendMessage(message: msgText)
            self.msgTextField.text = ""
        }
    }
    
    func sendMessage(message:String)
    {
        let publishOptions = PublishOptions()
        publishOptions.publisherId = "5DF302D1-CBFC-9D3A-FF64-71D1B84CEC00"
        let deliveryOption:DeliveryOptions = DeliveryOptions()
        //deliveryOption.pushPolicy(PUSH_ALSO)
        Backendless.sharedInstance().messaging.publish("CHN-626EC44A-5DAA-3B34-FFB0-A733BB011A00", message: message, publishOptions: publishOptions, deliveryOptions: deliveryOption, response: { (msgStatus:MessageStatus?) in
            print(msgStatus)
        }) { (err:Fault?) in
            print(err?.message != nil ? err!.message : "")
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
 }
 
