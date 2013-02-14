#import "FakeHTTP.h"
#import "FakeHTTPURLProtocol.h"

static __strong NSMutableDictionary *__responseForURL = nil;

@implementation FakeHTTP

+ (void)startMocking {
    __responseForURL = [NSMutableDictionary dictionary];
    [NSURLProtocol registerClass:[FakeHTTPURLProtocol class]];
}

+ (void)stopMocking {
    __responseForURL = nil;
    [NSURLProtocol unregisterClass:[FakeHTTPURLProtocol class]];
}

+ (BOOL)isMocking
{
    return __responseForURL != nil;
}

+ (void)registerURL:(NSURL *)url withResponse:(FakeHTTPURLResponse *)response {
    [__responseForURL setObject:response forKey:url.absoluteString];
}

+ (FakeHTTPURLResponse *)responseForURL:(NSURL *)url {
    return [__responseForURL objectForKey:url.absoluteString];
}

+ (void)reset {
    [__responseForURL removeAllObjects];
}

@end
