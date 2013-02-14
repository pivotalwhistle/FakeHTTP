#import "FakeHTTPURLResponse.h"

@interface FakeHTTP : NSObject

+ (BOOL)isMocking;
+ (void)startMocking;
+ (void)stopMocking;

+ (void)registerURL:(NSURL *)url withResponse:(FakeHTTPURLResponse *)response;
+ (FakeHTTPURLResponse *)responseForURL:(NSURL *)url;
+ (void)reset;

@end
