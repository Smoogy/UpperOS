//
//  UpperXPC.m
//  UpperXPC
//
//  Created by Callan Bush on 25/1/21.
//

#import "UpperXPC.h"

@implementation UpperXPC

// This implements the example protocol. Replace the body of this class with the implementation of this service's protocol.
- (void)upperCaseString:(NSString *)aString withReply:(void (^)(NSString *))reply {
    NSString *response = [aString uppercaseString];
    reply(response);
}

@end
