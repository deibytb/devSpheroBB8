//
//  Copyright 2011-2014 Orbotix Inc. All rights reserved.
//

/*! @file */

#import "RKDeviceCommand.h"

/*!
 * @brief Class that encapsulates a request for the robot's name and bluetooth address.
 *
 * Request for bluetooth information from a robot. The name that is returned is not the actual
 * bluetooth name but is stored in memory as a UTF-8 in order to accommodate
 *
 * This is a simple command that requires no parameters. 
 *
 * @sa RKGetBluetoothInfoResponse
 * @sa RKSetBluetoothNameCommand
 */
@interface RKGetBluetoothInfoCommand : RKDeviceCommand

+(instancetype) command;

@end
