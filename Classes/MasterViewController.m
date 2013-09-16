//
//  MasterViewController.m
//
//  Created by Jean-André Santoni on 16/07/13.
//  Copyright (c) 2013 Jean-André Santoni. All rights reserved.
//

#import "MasterViewController.h"
#import "RootViewController.h"
#import "AppDelegate.h"
#import <QuartzCore/QuartzCore.h>
NSArray* chapters;

@interface MasterViewController () <UITableViewDataSource, UITableViewDelegate>

@end

@implementation MasterViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.tableView.frame = CGRectMake(0, 0, 256, 1024);
    self.tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    
    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.tableFooterView = [[[UIView alloc] init] autorelease];
    [self.tableView setContentInset:UIEdgeInsetsMake(64,0,0,0)];
    [self.tableView setSeparatorInset:UIEdgeInsetsZero];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [chapters count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }

    cell.textLabel.text = [chapters.retain objectAtIndex:indexPath.row];
    //cell.imageView.image = [UIImage imageNamed:@"flower.png"];
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    int next = indexPath.row;
    
    NSString* call = [NSString stringWithFormat:@"loadpage(%i)", next];
    
    RootViewController* root = (RootViewController*) self.parentViewController;

    [UIView animateWithDuration:0.35 animations:^{
        CGRect fr = root.activeview.frame;
        fr.origin.y = 44*next;
        root.activeview.frame = fr;
        
        if (root.triggeredtop) {
            root.triggeredtop = NO;
            CGRect fr = root.pullviewtop.frame;
            fr.origin.y = -80;
            root.pullviewtop.frame = fr;
            [root.cdvViewController.webView.scrollView setContentOffset:CGPointMake(0, 0) animated:YES];
        }
        
        if (root.triggeredbottom) {
            root.triggeredbottom = NO;
            CGRect fr = root.pullviewbottom.frame;
            fr.origin.y = root.cdvViewController.webView.scrollView.frame.size.height;
            root.pullviewbottom.frame = fr;
            [root.cdvViewController.webView.scrollView setContentOffset:CGPointMake(0, root.cdvViewController.webView.scrollView.contentOffset.y-80) animated:YES];
        }
        
        if (root.triggeredburger) {
            CGRect fr2 = root.cdvViewController.view.frame;
            fr2.origin.x = 0;
            root.cdvViewController.view.frame = fr2;
            root.cdvViewController.webView.scrollView.userInteractionEnabled = YES;
            root.triggeredburger = NO;
        }

    } completion:^(BOOL finished){
        [root.cdvViewController.webView stringByEvaluatingJavaScriptFromString:call];
        if (next > 0) root.chapternametop.text = [chapters objectAtIndex:next-1];
        if (next < [chapters count]-1) root.chapternamebottom.text = [chapters objectAtIndex:next+1];
        current = next;
    }];
}

@end
