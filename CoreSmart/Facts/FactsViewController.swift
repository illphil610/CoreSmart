//
//  FactsViewController.swift
//  CoreSmart
//
//  Created by Philip on 1/19/20.
//  Copyright © 2020 Philip. All rights reserved.
//

import UIKit
import WebKit

class FactsViewController: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var loadingSpinner: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureWebView()
    }
    
    fileprivate func configureWebView() {
        webView.navigationDelegate = self
        loadingSpinner.hidesWhenStopped = true
        webView.allowsLinkPreview = false
        webView.backgroundColor = .black
        webView.isOpaque = false
        
        let myURL = URL(string:"https://thinkcoresmart.com/facts")
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
}

extension FactsViewController: WKNavigationDelegate {
    
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
