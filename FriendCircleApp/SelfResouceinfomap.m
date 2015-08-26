//
//  SelfResouceinfomap.m
//  FriendCircleApp
//
//  Created by TWer  on 8/26/15.
//  Copyright (c) 2015 TWer . All rights reserved.
//

#import "SelfResouceinfomap.h"

@implementation SelfResouceinfomap
+(SelfResouce*) selfInfo:(NSMutableArray*) headerarray
{
    SelfResouce *selfresouce=[SelfResouce new];
    selfresouce.headname=[[headerarray valueForKey:@"headname"] componentsJoinedByString:@""];
    selfresouce.headimage=[[headerarray valueForKey:@"headimage"] componentsJoinedByString:@""];
    selfresouce.headicron=[[headerarray valueForKey:@"headicron"] componentsJoinedByString:@""];

    return selfresouce;
}
@end
