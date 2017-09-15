//
//  WebViewController.swift
//  Bout Time
//
//  Created by Max Ramirez on 9/14/17.
//  Copyright © 2017 MaxRamirez. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController {
    var webView: WKWebView!
    var eventLink: URL!
    
    @IBOutlet weak var webViewContainer: UIView!
    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self as? WKUIDelegate
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let img = UIImage(named: "webview_bar")
        navigationController?.navigationBar.setBackgroundImage(img, for: .default)
        
        let myURL = URL(string: "https://google.com")
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    


}
