//
//  ViewController.m
//  pennapps
//
//  Created by Jonah Back on 9/13/14.
//  Copyright (c) 2014 Jonah Back. All rights reserved.
//

#import "ViewController.h"
#import "GroupTableViewController.h"
#import <FacebookSDK/FacebookSDK.h>
@interface ViewController ()

@end

@implementation ViewController 

- (void)viewDidLoad {
    [super viewDidLoad];
    
    FBLoginView *loginView = [[FBLoginView alloc] initWithReadPermissions:@[@"user_groups",@"user_likes" ]];
    [loginView setDelegate:self];
    // Align the button in the center horizontally
    loginView.frame = CGRectOffset(loginView.frame, (self.view.center.x - (loginView.frame.size.width / 2)), 5);
    [self.view addSubview:loginView];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) loginViewShowingLoggedInUser:(FBLoginView *)loginView {
    
}

- (void)loginViewFetchedUserInfo:(FBLoginView *)loginView
                            user:(id<FBGraphUser>)user {
    [FBRequestConnection startWithGraphPath:@"/me/groups" completionHandler:^(FBRequestConnection *connection, id result, NSError *error) {
        NSArray* groups = (NSArray*)[result data];
        
        GroupTableViewController* tableViewController = [[GroupTableViewController alloc] init];
        tableViewController.groupItems = groups;
        tableViewController.userID = user.id;
        
        [self presentViewController:tableViewController animated:NO completion:^{
            //
        }];

    }];
}

@end
