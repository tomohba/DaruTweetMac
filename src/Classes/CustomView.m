#import "CustomView.h"
#import "Controller.h"

@implementation CustomView

@synthesize daruImage;

- (void)awakeFromNib {
    self.daruImage = [NSImage imageNamed:@"daruyanagi"];
    Controller *controller = (Controller *)self.window.windowController;
    [controller  requestDaruTweet];
}

- (void)dealloc {
    [daruImage release];
    [super dealloc];
}

- (void)drawRect:(NSRect)rect {
    [[NSColor clearColor] set];
    NSRectFill([self frame]);
    [daruImage drawAtPoint:NSZeroPoint fromRect:NSZeroRect operation:NSCompositeSourceOver fraction:1.0];
}



@end
