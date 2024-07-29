//
//  CSAPIRequest.h
//  CallSignNetworking
//
//  Created by subhajit paul on 27/7/2024.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@protocol APIRequest <NSObject>

@property (nonatomic, readonly) NSURL *url;
@property (nonatomic, readonly) NSString *httpMethod;
@property (nonatomic, readonly, nullable) NSDictionary *parameters;
@property (nonatomic, readonly, nullable) NSDictionary *headers;

- (instancetype)initWithURL:(NSURL *)url
                 httpMethod:(NSString *)httpMethod
                 parameters:(nullable NSDictionary *)parameters
                    headers:(nullable NSDictionary *)headers;

@end

@interface CSAPIRequest : NSObject <APIRequest>

@end
NS_ASSUME_NONNULL_END
