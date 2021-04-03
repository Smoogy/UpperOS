//
//  Receive.m
//  Relay
//
//  Created by Callan Bush on 24/1/21.
//

#import <Foundation/Foundation.h>
#import "Receive.h"
#import <xpc/xpc.h>
#import "UpperXPCProtocol.h"

@implementation Receive
    +(NSString *) callXPC:(NSString *)string {
        NSXPCConnection* _connectionToService = [[NSXPCConnection alloc] initWithServiceName:@"smoogy.UpperXPC"];
        _connectionToService.remoteObjectInterface = [NSXPCInterface interfaceWithProtocol:@protocol(UpperXPCProtocol)];
        [_connectionToService resume];
        
        __block NSString *result = nil;
                
        [[_connectionToService synchronousRemoteObjectProxyWithErrorHandler:^(NSError * _Nonnull error) {
            NSLog(@"%@", error.localizedDescription);
        }]
         upperCaseString:string withReply:^(NSString *reply) {
            result = reply;
        }];
        return result;
    }
@end
