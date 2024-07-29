//
//  CSNetworkManager.h
//  CallSignNetworking
//
//  Created by subhajit paul on 27/7/2024.
//

#import <Foundation/Foundation.h>
#import <CallSignNetworking/CSAPIRequest.h>
#import <CallSignNetworking/CSAPIResponse.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^APIClientCompletionBlock)(Class<APIResponse> _Nullable response,NSError * _Nullable error);
@interface CSNetworkManager : NSObject

+ (instancetype)sharedManager;

- (NSURLSessionDataTask *)dataTaskWithAPIRequest:(id<APIRequest>)request
                                    responseType:(id<APIResponse>)responseParser
                                      completion:(APIClientCompletionBlock)completion;

@end

NS_ASSUME_NONNULL_END
