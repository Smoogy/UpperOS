//
//  UpperXPC.h
//  UpperXPC
//
//  Created by Callan Bush on 25/1/21.
//

#import <Foundation/Foundation.h>
#import "UpperXPCProtocol.h"

// This object implements the protocol which we have defined. It provides the actual behavior for the service. It is 'exported' by the service to make it available to the process hosting the service over an NSXPCConnection.
@interface UpperXPC : NSObject <UpperXPCProtocol>
@end
