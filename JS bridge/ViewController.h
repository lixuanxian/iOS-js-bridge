//
//  ViewController.h
//  JS bridge
//
//  Created by Rafael Iga on 9/19/12.
//  Copyright (c) 2012 RubyThree. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIWebViewDelegate>
- (IBAction)executeJS:(id)sender;
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end
