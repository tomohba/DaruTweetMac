#import <Cocoa/Cocoa.h>

@interface CustomWindow : NSWindow {
    NSPoint initialLocation;
}

@property (assign) NSPoint initialLocation;

@end
