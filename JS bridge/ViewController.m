//
//  ViewController.m
//  JS bridge
//
//  Created by Rafael Iga on 9/19/12.
//  Copyright (c) 2012 RubyThree. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize webView;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    webView.delegate = self;
    
    NSString *htmlFile = [[NSBundle mainBundle] pathForResource:@"test" ofType:@"html" inDirectory:@""];
    NSString* htmlString = [NSString stringWithContentsOfFile:htmlFile encoding:NSUTF8StringEncoding error:nil];
    [webView loadHTMLString:htmlString baseURL:nil];
}

- (void)viewDidUnload
{
    [self setWebView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

- (IBAction)executeJS:(id)sender
{
    NSString *returnValue = [webView stringByEvaluatingJavaScriptFromString:@"showJSON('{\"id\": \"1\"}')"];
    NSLog(@"--- return: %@", returnValue);
}

- (BOOL)webView:(UIWebView*)webView shouldStartLoadWithRequest:(NSURLRequest*)request navigationType:(UIWebViewNavigationType)navigationType
{
    NSURL *URL = [request URL];
    
    if ([[URL scheme] isEqualToString:@"native"])
    {
        NSLog(@"==== parse the rest of the URL object and execute functions: %@", URL);
    }
    
    return YES;
}

@end
