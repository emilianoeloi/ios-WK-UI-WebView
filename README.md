# iOS WKWebView UIWebView

"A WKWebView object displays interactive web content, such as for an in-app browser.

For new development, employ this class instead of the older UIWebView class."

## Initialize a Web View

### Configuration

A WKWebViewConfiguration object is a collection of properties used to initialize a web view.

	- ScrollView

	- Title

	- URL

	- customUserAgent

	- certificateChain

## Delegates

	- navigationDelegate

	- UIDelegate

## Loading Content

	- estimatedProgress

	- hasOnlySecuireContent

	- loadingHTMLStriong:baseURL:

	- loading

	- reloadFromOrigin

	- stopLoading

	- loadData:MIMEType:charseterEncodingName:baseURL:

	- loadFileURL:allowingReadAccessToURL:

## Navigating

	- allowsBackForwardNavigationGestures

	- backForwardList

	- carGoBack

	- carGoForward

	- allowsLinkPreview

	- goBAck

	- goForward

	- goToBackForwardListItem:

	- loadRequest:

## Executing JavaScript

	- evaluateJavascript:completionHandler:

## Referencias

Javascript Bridge: https://github.com/marcuswestin/WebViewJavascriptBridge

How To Use iOS WKWebView with UIWebView Fallback: http://floatlearning.com/2014/12/one-webview-to-rule-them-all/

WKWebView vs UIWebView: http://blog.initlabs.com/post/100113463211/wkwebview-vs-uiwebview

WKWebView: https://developer.apple.com/library/ios/documentation/WebKit/Reference/WKWebView_Ref/index.html

Getting started with WKWebView using Swift in iOS 8: http://www.kinderas.com/technology/2014/6/7/getting-started-with-wkwebview-using-swift-in-ios-8

WKWeb​View: http://nshipster.com/wkwebkit/

html5test: https://html5test.com/
