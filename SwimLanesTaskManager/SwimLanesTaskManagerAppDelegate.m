//
//  SwimLanesTaskManagerAppDelegate.m
//  SwimLanesTaskManager
//
//  Created by  John Pavley on 6/21/13.
//  Copyright (c) 2013  John Pavley. All rights reserved.
//

#import "SwimLanesTaskManagerAppDelegate.h"

NSString *const kColumn1 = @"col1";
NSString *const kColumn2 = @"col2";
NSString *const kColumn3 = @"col3";
NSString *const kColumn4 = @"col4";

@implementation SwimLanesTaskManagerAppDelegate

@synthesize _backlog,
            _inProgress,
            _completed,
            _onHold;

@synthesize window,
            taskTextField,
            taskAddButton,
            taskTable,
            clearCompletedButton,
            clearOnHoldButton;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    NSLog(@"%@" , NSStringFromSelector(_cmd));
}

- (IBAction)addTask:(id)sender
{
    NSLog(@"%@" , NSStringFromSelector(_cmd));
    NSString *taskString = [taskTextField stringValue];
    if ([taskString length] != 0) {
        [_backlog addObject:taskString];
    }
    [taskTable reloadData];
}

- (IBAction)clearCompleted:(id)sender
{
    NSLog(@"%@" , NSStringFromSelector(_cmd));
    
}

- (IBAction)clearOnHold:(id)sender
{
    NSLog(@"%@" , NSStringFromSelector(_cmd));
    
}

- (void)awakeFromNib
{
    NSLog(@"%@" , NSStringFromSelector(_cmd));
    
}

- (NSInteger)numberOfRowsInTableView:(NSTableView *)tv
{
    NSLog(@"%@" , NSStringFromSelector(_cmd));
    NSInteger result = 0;
    
    // return the lenth of the array with the most members
    
    result = MAX(result, [_backlog count]);
    result = MAX(result, [_inProgress count]);
    result = MAX(result, [_completed count]);
    result = MAX(result, [_onHold count]);
    
    return result;
}

- (id)tableView:(NSTableView *)tv objectValueForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row
{
    NSLog(@"%@" , NSStringFromSelector(_cmd));
    NSString *result = nil;
    
    if ([[tableColumn identifier] isEqualToString:kColumn1]) {
        result = [_backlog objectAtIndex:row];
    } else if ([[tableColumn identifier] isEqualToString:kColumn2]) {
        result = [_inProgress objectAtIndex:row];
        
    } else if ([[tableColumn identifier] isEqualToString:kColumn3]) {
        result = [_completed objectAtIndex:row];
       
    } else if ([[tableColumn identifier] isEqualToString:kColumn4]) {
        result = [_onHold objectAtIndex:row];
    }
    
    return result;
}

- (void)tableViewSelectionDidChange:(NSNotification *)notification
{
    NSLog(@"%@" , NSStringFromSelector(_cmd));
    
}

@end
