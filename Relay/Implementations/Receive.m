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

@interface Receive ()
// private
-(void) connectToService;

@end

@implementation Receive
static NSXPCConnection* _connectionToService;

-(NSString *) callXPC:(NSString *)string {
    __block NSString *result = nil;
    [self connectToService];
    [[_connectionToService synchronousRemoteObjectProxyWithErrorHandler:^(NSError * _Nonnull error) {
        NSLog(@"%@", error.localizedDescription);
    }]
     upperCaseString:string withReply:^(NSString *reply) {
        result = reply;
    }];
    return result;
}

-(void)connectToService {
    if (_connectionToService == nil) {
        _connectionToService = [[NSXPCConnection alloc] initWithServiceName:@"smoogy.UpperXPC"];
        _connectionToService.remoteObjectInterface = [NSXPCInterface interfaceWithProtocol:@protocol(UpperXPCProtocol)];
        [_connectionToService resume];
    }
}
@end
