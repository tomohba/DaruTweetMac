#import "Controller.h"


@implementation Controller
@synthesize tweet;

- (void)requestDaruTweet {
    [self requestDaruAPI:nil];
}

/* だるTweetAPI (made by しばやん) にリクエストをぶん投げる */
- (void)requestDaruAPI:(NSTimer*)timer {
    contents = [[NSMutableData alloc] init];
    NSString* address = @"http://api.daruyanagi.info/1/tweet";
    NSURL* url = [NSURL URLWithString:address];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL: url];
    NSURLConnection* connection = [
                                   [NSURLConnection alloc]
                                   initWithRequest : request
                                   delegate : self
                                   ];
    if (!connection) {
        NSLog(@"connection error.");
    }
    [request release];
    
    // 10秒後に再度取得
    [NSTimer
     scheduledTimerWithTimeInterval:10.0f
     target:self
     selector:@selector(requestDaruAPI:)
     userInfo:nil
     repeats:NO
     ];
}

/* データを受け取る度に呼び出される */
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [contents appendData:data];
}

/* データを全て受け取ると呼び出される */
- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSString *content = [[NSString alloc] initWithData:contents
                                            encoding:NSUTF8StringEncoding];
    // 前後の " を取る
    NSRange r = NSMakeRange(1, [content length] - 2);
    NSString *t = [content substringWithRange:r];
    [tweet setTitle:t];
    
    NSLog(@"%@", t);
    [content release];
    [contents release];
}

@end
