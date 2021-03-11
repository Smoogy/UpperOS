//
//  UpperXPC.m
//  UpperXPC
//
//  Created by Callan Bush on 25/1/21.
//

#import "UpperXPC.h"

@implementation UpperXPC

- (void)upperCaseString:(NSString *)aString withReply:(void (^)(NSString *))reply {
    NSString *response = [aString uppercaseString];
    reply(response);
}

@end
