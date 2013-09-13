//
//  MasterViewController.m
//
//  Created by Jean-André Santoni on 16/07/13.
//  Copyright (c) 2013 Jean-André Santoni. All rights reserved.
//

#import "MasterViewController.h"
#import "RootViewController.h"
#import "AppDelegate.h"
#import "UIMasterViewCell.h"
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

    self.tableView.frame = CGRectMake(0, 0, 256, 1004);
    self.tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.tableFooterView = [[[UIView alloc] init] autorelease];
    self.tableView.backgroundColor = [UIColor colorWithRed:.13 green:.13 blue:.13 alpha:1];
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
    return 40;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *MasterCellIdentifier = @"MasterCell";

    UIMasterViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MasterCellIdentifier];
    
    if (cell == nil) {
        cell = [[[UIMasterViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:MasterCellIdentifier] autorelease];
    }

    if (indexPath.row == 0) {
        cell.primaryLabel.text = [chapters.retain objectAtIndex:indexPath.row];
    } else {
        cell.primaryLabel.text = [[chapters.retain objectAtIndex:indexPath.row] uppercaseString];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
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
        fr.origin.y = 40*next;
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

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    [cell setBackgroundColor:[colors.retain objectAtIndex:indexPath.row]];
}

@end
