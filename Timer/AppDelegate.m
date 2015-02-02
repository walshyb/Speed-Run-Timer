//
//  AppDelegate.m
//  Timer
//
//  Created by Brandon Walsh on 1/31/15.
//  Copyright (c) 2015 Brandon Walsh. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate
NSTimeInterval startTime = 0;
NSTimer *timer;
NSTimeInterval curTime;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application

}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

- (void)updateTime{
    NSTimeInterval currentTime = [NSDate timeIntervalSinceReferenceDate];
    
    elapsedTime = currentTime - startTime;
    
    NSInteger minutes = (UInt8)(elapsedTime / 60.0);
    elapsedTime -= (minutes * 60);
    
    NSInteger seconds = (UInt8)elapsedTime;
    elapsedTime -= seconds;
    
    NSInteger fraction = (UInt8)(elapsedTime * 100);
    
    NSString *strMinutes;
    if(minutes <= 9)
    {
        strMinutes = [NSString stringWithFormat:@"0%ld", minutes];
    }
    else
    {
        strMinutes = [NSString stringWithFormat:@"%ld", minutes];
    }
    
    NSString *strSeconds;
    if(seconds <= 9)
    {
        strSeconds = [NSString stringWithFormat:@"0%ld", seconds];
    }
    else
    {
        strSeconds = [NSString stringWithFormat:@"%ld", seconds];
    }
    NSString *strFraction = [NSString stringWithFormat:@"%ld", fraction];
    
    NSString *fullTime = [NSString stringWithFormat:@"%@:%@:%@", strMinutes, strSeconds, strFraction];
    _timerLabel.stringValue = fullTime;
    
}

- (IBAction)startButtonClick:(id)sender {
    timer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(updateTime) userInfo:nil repeats:YES];
    if(startTime == 0)
    {
        startTime = [NSDate timeIntervalSinceReferenceDate];
    }
    else
    {
        startTime = curTime;
    }
}

- (IBAction)stopButtonClick:(id)sender {
    curTime = [NSDate timeIntervalSinceReferenceDate];
    [timer invalidate];
    startTime = curTime;
}

- (IBAction)resetButtonClick:(id)sender {
    [timer invalidate];
    timer = nil;
    startTime = 0;
    _timerLabel.stringValue = @"00:00:00";
}
@end
