//
//  GroupTableViewController.h
//  pennapps
//
//  Created by Jonah Back on 9/13/14.
//  Copyright (c) 2014 Jonah Back. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Firebase/Firebase.h>

@interface GroupTableViewController : UITableViewController <UITableViewDataSource, UITableViewDelegate>

@property NSArray* groupItems;
@property NSString* userID;
@property Firebase* firebase;
@end
