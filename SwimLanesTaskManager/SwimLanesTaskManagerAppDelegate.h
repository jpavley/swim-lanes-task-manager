//
//  SwimLanesTaskManagerAppDelegate.h
//  SwimLanesTaskManager
//
//  Created by  John Pavley on 6/21/13.
//  Copyright (c) 2013  John Pavley. All rights reserved.
//

#import <Cocoa/Cocoa.h>

FOUNDATION_EXPORT NSString *const kColumn1;
FOUNDATION_EXPORT NSString *const kColumn2;
FOUNDATION_EXPORT NSString *const kColumn3;
FOUNDATION_EXPORT NSString *const kColumn4;

@interface SwimLanesTaskManagerAppDelegate : NSObject <NSApplicationDelegate>

@property (strong) NSMutableArray *_backlog;
@property (strong) NSMutableArray *_inProgress;
@property (strong) NSMutableArray *_completed;
@property (strong) NSMutableArray *_onHold;

@property (assign) IBOutlet NSWindow *window;
@property (weak) IBOutlet NSTextField *taskTextField;
@property (weak) IBOutlet NSButton *taskAddButton;
@property (weak) IBOutlet NSButton *clearCompletedButton;
@property (weak) IBOutlet NSButton *clearOnHoldButton;
@property (weak) IBOutlet NSTableView *taskTable;

- (IBAction)addTask:(id)sender;
- (IBAction)clearCompleted:(id)sender;
- (IBAction)clearOnHold:(id)sender;

@end
