#import <Cocoa/Cocoa.h>

@interface Controller : NSWindowController  <NSURLConnectionDelegate> {
    NSMutableData *contents;
    NSTextFieldCell *tweet;
}

@property (assign) IBOutlet NSTextFieldCell *tweet;
- (void)requestDaruTweet;

@end
