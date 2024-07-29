//
//  CSAPIResponse.m
//  CallSignNetworking
//
//  Created by subhajit paul on 27/7/2024.
//

#import "CSAPIResponse.h"

@interface SimpleAPIResponse ()

@property (nonatomic, copy) NSError *error;
@property (nonatomic, strong) id responseObject;
@property (nonatomic, strong) id processedResponseObject;

@end

@implementation SimpleAPIResponse

- (instancetype)initWithResponseObject:(id)responseObject
                                 error:(NSError *)error;
{
    self = [super init];
    if (self) {
        self.error = error;
        self.responseObject = responseObject;
        
        if (!error) {
            NSError *serializationError;
            self.processedResponseObject = [self processResponseObject:&serializationError];
            if (serializationError) {
                self.error = serializationError;
            }
        }
    }
    return self;
}

- (id)processResponseObject:(NSError *__autoreleasing *)error
{
    return  self.responseObject;
}

@end

@implementation JSONAPIResponse

- (id)processResponseObject:(NSError *__autoreleasing *)error
{
    if ([self.responseObject isKindOfClass:[NSData class]]) {
        NSError *serializationError;
        id processedResponseObject = [NSJSONSerialization JSONObjectWithData:self.responseObject options:0 error:&serializationError];
        if (error) *error = serializationError;
        return processedResponseObject;
    }
    else {
        return nil;
    }
}

@end

