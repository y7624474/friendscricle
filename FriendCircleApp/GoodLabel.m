//
//  GoodLabel.m
//  FriendCircleApp
//
//  Created by TWer  on 8/31/15.
//  Copyright (c) 2015 TWer . All rights reserved.
//

#import "GoodLabel.h"

static GoodLabel *goodlabel=nil;
@implementation GoodLabel

+ (GoodLabel *)getInstance {
    
    @synchronized(self) {
        if (goodlabel == nil) {
            goodlabel = [[GoodLabel alloc] init];
            goodlabel.dicgood=[NSMutableDictionary dictionary];
        }
    }
    
    return goodlabel;
}

@end
