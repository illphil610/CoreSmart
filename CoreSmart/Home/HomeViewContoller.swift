//
//  HomeViewContoller.swift
//  CoreSmart
//
//  Created by Philip on 1/18/20.
//  Copyright © 2020 Philip. All rights reserved.
//

import UIKit
import WebKit
import Alamofire

class HomeViewController: UIViewController, WKUIDelegate {

    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var loadingSpinner: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureWebViewWithLoadingSpinner()
        
        AF.request("https://thinkcoresmart.com/?format=json-pretty").responseJSON { response in
            debugPrint(response)
        }
    }
    
    fileprivate func configureWebViewWithLoadingSpinner() {
        loadingSpinner.hidesWhenStopped = true
        webView.navigationDelegate = self
        webView.allowsLinkPreview = false
        webView.backgroundColor = .black
        webView.isOpaque = false
        
        let myURL = URL(string:"https://thinkcoresmart.com")
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
}

extension HomeViewController: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        loadingSpinner.startAnimating()
    }

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        loadingSpinner.stopAnimating()
    }
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        loadingSpinner.stopAnimating()
    }
    
}
