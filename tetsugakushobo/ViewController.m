//
//  ViewController.m
//  tetsugakushobo
//
//  Created by 豊福 剛 on 12/03/18.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSString *path = [[NSBundle mainBundle] pathForResource:@"index" ofType:@"html"];
    NSURL *url = [NSURL fileURLWithPath:path];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    CGRect bounds = [[UIScreen mainScreen] applicationFrame];
    CGRect viewRect = CGRectMake(0.0, 0.0, bounds.size.width, bounds.size.height);
	htmlView = [[UIWebView alloc] initWithFrame: viewRect];
    htmlView.scalesPageToFit = YES;
	htmlView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    htmlView.delegate = self;

    [htmlView loadRequest:request];
//    [self.view addSubview:htmlView];
    self.view = htmlView;
//	[htmlView release];
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
	NSString* scheme = [[request URL] scheme];
	if([scheme compare:@"http"] == NSOrderedSame) {
		[[UIApplication sharedApplication] openURL: [request URL]];
        return NO;
	}
	return YES;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait
			|| interfaceOrientation == UIInterfaceOrientationPortraitUpsideDown);
}

@end
