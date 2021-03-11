//
//  UpperXPCProtocol.h
//  UpperXPC
//
//  Created by Callan Bush on 25/1/21.
//

#import <Foundation/Foundation.h>

@protocol UpperXPCProtocol

- (void)upperCaseString:(NSString *)aString withReply:(void (^)(NSString *))reply;
    
@end
