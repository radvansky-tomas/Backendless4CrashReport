 import UIKit

class ViewController: UIViewController {
    
    let APPLICATION_ID = "02E0B487-71CE-DB1E-FF7F-79892D128500"
    let API_KEY = "11FB143C-E216-C61D-FFF2-EFA9D4DB9B00"
    let SERVER_URL = "https://api.backendless.com"
    let backendless = Backendless.sharedInstance()!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        backendless.hostURL = SERVER_URL
        backendless.initApp(APPLICATION_ID, apiKey: API_KEY)
        
        let queryBuilder = DataQueryBuilder()
        _ = queryBuilder?.setRelationsDepth(5)
        let whereClause = "to.objectId = '626EC44A-5DAA-3B34-FFB0-A733BB011A00' OR to.objectId = '5DF302D1-CBFC-9D3A-FF64-71D1B84CEC00' OR from.objectId = '626EC44A-5DAA-3B34-FFB0-A733BB011A00' OR from.objectId = '5DF302D1-CBFC-9D3A-FF64-71D1B84CEC00'"
        _ = queryBuilder?.setWhereClause(whereClause)
        print(whereClause)
        Backendless.sharedInstance().data.of(Messages.self).find(queryBuilder, response: { (res:Any?) in
           print(res)
        }, error: { (err:Fault?) in
            print("Server reported an error: \(err)")
        })
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
        
