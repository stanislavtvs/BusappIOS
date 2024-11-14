import SwiftUI

class MainAppViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let busAppView = BusAppView()
        let hostingController = UIHostingController(rootView: busAppView)
        
        addChild(hostingController)
        view.addSubview(hostingController.view)
        hostingController.view.frame = view.bounds
        hostingController.didMove(toParent: self)
    }
}

