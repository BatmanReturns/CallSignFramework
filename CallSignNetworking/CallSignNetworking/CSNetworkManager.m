//
//  CSNetworkManager.m
//  CallSignNetworking
//
//  Created by subhajit paul on 27/7/2024.
//

#import "CSNetworkManager.h"

@implementation CSNetworkManager

+ (instancetype)sharedManager {
    static CSNetworkManager *sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedManager = [[self alloc] init];
    });
    return sharedManager;
}

- (NSURLSessionDataTask *)dataTaskWithAPIRequest:
                                        (id<APIRequest>)request
                                    responseType:(id<APIResponse>)responseParser
                                      completion:(APIClientCompletionBlock)completion {
    NSURLSession *session = [NSURLSession sharedSession];
    NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:request.url];
    [urlRequest setHTTPMethod:request.httpMethod];
    
    if ([request.httpMethod isEqualToString:@"POST"] && request.parameters) {
        [urlRequest setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        NSError *error;
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:request.parameters options:0 error:&error];
        if (error) {
            if (completion) {
                completion(nil, error);
            }
            return nil;
        }
        [urlRequest setHTTPBody:jsonData];
    }
    
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:urlRequest
                                                completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        id<APIResponse> apiResponse = [responseParser initWithResponseObject:data error:error];
        dispatch_async(dispatch_get_main_queue(), ^{
            if (completion) { completion(apiResponse.processedResponseObject,nil); }
        });
    }];
    [dataTask resume];
    
    return dataTask;
}

@end

