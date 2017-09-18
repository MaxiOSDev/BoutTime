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
    var linkEvent: URL!
    var link = "https://www.google.com"
    @IBOutlet weak var webViewContainer: UIView!
    
//    override func loadView() {
//        let webConfiguration = WKWebViewConfiguration()
//        webView = WKWebView(frame: .zero, configuration: webConfiguration)
//        webView.uiDelegate = self as? WKUIDelegate
//        view = webView
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //let img = UIImage(named: "webview_bar")
        UINavigationBar.appearance().setBackgroundImage(UIImage(named: "webview_bar")!.resizableImage(withCapInsets: UIEdgeInsetsMake(0, 0, 0, 0)), for: .default)
        
        webView = WKWebView(frame: webViewContainer.frame, configuration: WKWebViewConfiguration())
        webViewContainer.addSubview(webView)
        constrainView(view: webView, toView: webViewContainer)
        
       // loadWebPages()
        
        let link = URL(string: self.link)
        let request = URLRequest(url: link!)
        
        webView.load(request)
        

    }
    override var prefersStatusBarHidden: Bool {
        return true
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    
    func loadWebPages() {
        let url1 = URL(string: appleHistoricalEvents.0.url)
        let url2 = URL(string: appleHistoricalEvents.1.url)
        let url3 = URL(string: appleHistoricalEvents.2.url)
        let url4 = URL(string: appleHistoricalEvents.3.url)
        
        let request1 = URLRequest(url: url1!)
        let request2 = URLRequest(url: url2!)
        let request3 = URLRequest(url: url3!)
        let request4 = URLRequest(url: url4!)
        
        webView.load(request1)
        webView.load(request2)
        webView.load(request3)
        webView.load(request4)
    }
    


}

func constrainView(view:UIView, toView contentView:UIView) {
    view.translatesAutoresizingMaskIntoConstraints = false
    view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
    view.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
    view.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
    view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
}










