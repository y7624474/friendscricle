//
//  Friendsinfomap.m
//  FriendCircleApp
//
//  Created by TWer  on 8/24/15.
//  Copyright (c) 2015 TWer . All rights reserved.
//

#import "Friendsinfomap.h"

@implementation Friendsinfomap
+(FriendsInfo*) friendsInfo:(NSMutableArray *)friendsarray
{
    FriendsInfo* friendsinfo=[FriendsInfo new];
    
    friendsinfo.name=[friendsarray valueForKey:@"name"];
    friendsinfo.icron=[friendsarray valueForKey:@"icron"];
    friendsinfo.content=[friendsarray valueForKey:@"content"];
    friendsinfo.time=[friendsarray valueForKey:@"time"];
    friendsinfo.imagecontent=[friendsarray valueForKey:@"imagecontent"];
    friendsinfo.comments=[friendsarray valueForKey:@"comments"];
    return friendsinfo;
}
@end
