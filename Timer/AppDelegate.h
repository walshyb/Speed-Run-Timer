//
//  AppDelegate.h
//  Timer
//
//  Created by Brandon Walsh on 1/31/15.
//  Copyright (c) 2015 Brandon Walsh. All rights reserved.
//

#import <Cocoa/Cocoa.h>

NSDate *startDate;
NSTimeInterval elapsedTime;

@interface AppDelegate : NSObject <NSApplicationDelegate, NSTextFieldDelegate, NSTextViewDelegate>

@property (weak) IBOutlet NSButton *resetButton;

@property (weak) IBOutlet NSTextField *timerLabel;

@property (weak) IBOutlet NSButton *startButton;

@property (weak) IBOutlet NSButton *stopButton;

- (IBAction)startButtonClick:(id)sender;
- (IBAction)stopButtonClick:(id)sender;
- (IBAction)resetButtonClick:(id)sender;

@property (weak) IBOutlet NSTextFieldCell *idkText;

@end

