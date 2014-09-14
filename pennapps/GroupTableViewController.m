//
//  GroupTableViewController.m
//  pennapps
//
//  Created by Jonah Back on 9/13/14.
//  Copyright (c) 2014 Jonah Back. All rights reserved.
//

#import "GroupTableViewController.h"
#import <Firebase/Firebase.h>

@implementation GroupTableViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView setAllowsMultipleSelection:YES];
    self.firebase = [[Firebase alloc] initWithUrl:@"https://pennappsx.firebaseio.com"];
    // Do any additional setup after loading the view, typically from a nib.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Number of rows is the number of time zones in the region for the specified section.
    return [self.groupItems count];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [[tableView cellForRowAtIndexPath:indexPath] setSelected:YES];
    Firebase* user = [[self.firebase childByAppendingPath:@"users"] childByAppendingPath:self.userID];
    NSString* groupID = [[self.groupItems objectAtIndex:indexPath.row] valueForKey:@"id"];
    [[user childByAppendingPath:groupID] setValue:@"true"];
    
    
}
- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [[tableView cellForRowAtIndexPath:indexPath] setSelected:NO];
    Firebase* user = [[self.firebase childByAppendingPath:@"users"] childByAppendingPath:self.userID];
    NSString* groupID = [[self.groupItems objectAtIndex:indexPath.row] valueForKey:@"id"];
    [[user childByAppendingPath:groupID] removeValue];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *MyIdentifier = @"MyReuseIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault  reuseIdentifier:MyIdentifier];
    }
    NSDictionary* item = self.groupItems[indexPath.row];
    cell.textLabel.text = [item valueForKey:@"name"];
    return cell;
}



@end