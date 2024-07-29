//
//  CSAPIResponse.h
//  CallSignNetworking
//
//  Created by subhajit paul on 27/7/2024.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@protocol APIResponse <NSObject>

- (NSError *)error;
- (id)responseObject;
- (id)processedResponseObject;

- (instancetype)initWithResponseObject:(id)responseObject
                       error:(NSError *)error;

- (id)processResponseObject:(NSError **)error;

@end
@interface SimpleAPIResponse: NSObject <APIResponse> {
    NSURLSessionDataTask *_task;
    NSURLResponse *_response;
    NSError *_error;
    id _responseObject;
    id _processedResponseObject;
}

@end

@interface JSONAPIResponse : SimpleAPIResponse

@end

NS_ASSUME_NONNULL_END
