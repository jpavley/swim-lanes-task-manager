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
    
    // init arrays that hold the tasks
    
    _backlog = [[NSMutableArray alloc] init];
    _inProgress = [[NSMutableArray alloc] init];
    _completed = [[NSMutableArray alloc] init];
    _onHold = [[NSMutableArray alloc] init];
}

- (IBAction)addTask:(id)sender
{
    NSLog(@"%@" , NSStringFromSelector(_cmd));
    
    // a new task is always added to the backlog!
    
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
    
    // truth table to simplify ugly if/else statements below
    
    // TODO: Should I cache these values for performance?
    
    BOOL isColumn1 = [[tableColumn identifier] isEqualToString:kColumn1];
    BOOL isColumn2 = [[tableColumn identifier] isEqualToString:kColumn2];
    BOOL isColumn3 = [[tableColumn identifier] isEqualToString:kColumn3];
    BOOL isColumn4 = [[tableColumn identifier] isEqualToString:kColumn4];
    
    BOOL isBacklogGreaterThanZero = [_backlog count] > 0;
    BOOL isInProgressGreaterThanZero = [_inProgress count] > 0;
    BOOL isCompletedGreaterThanZero = [_completed count] > 0;
    BOOL isOnHoldGreaterThanZero = [_onHold count] > 0;
    
    // ugly if/else statement which are now more readable
    
    if (isColumn1 && isBacklogGreaterThanZero) {
        result = [_backlog objectAtIndex:row];
        
    } else if (isColumn2 && isInProgressGreaterThanZero) {
        result = [_inProgress objectAtIndex:row];
        
    } else if (isColumn3 && isCompletedGreaterThanZero) {
        result = [_completed objectAtIndex:row];
       
    } else if (isColumn4 && isOnHoldGreaterThanZero) {
        result = [_onHold objectAtIndex:row];
    }
    
    return result;
}

- (void)tableViewSelectionDidChange:(NSNotification *)notification
{
    NSLog(@"%@" , NSStringFromSelector(_cmd));
    
}

@end
