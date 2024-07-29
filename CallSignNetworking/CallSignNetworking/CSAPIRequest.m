//
//  CSAPIRequest.m
//  CallSignNetworking
//
//  Created by subhajit paul on 27/7/2024.
//

#import "CSAPIRequest.h"

@interface CSAPIRequest()

@property (nonatomic, copy) NSURL *url;
@property (nonatomic, copy) NSString *httpMethod;
@property (nonatomic, copy) NSDictionary *parameters;
@property (nonatomic, copy) NSDictionary *headers;

@end

@implementation CSAPIRequest

- (instancetype)initWithURL:(NSURL *)url
                 httpMethod:(NSString *)httpMethod
                 parameters:(nullable NSDictionary *)parameters
                    headers:(nullable NSDictionary *)header {
    self = [super init];
    if (self) {
        _url = url;
        _httpMethod = httpMethod;
        _parameters = parameters;
    }
    return self;
}

@end
