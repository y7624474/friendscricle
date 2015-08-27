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
    FriendsInfo* friendsinfolist=[FriendsInfo new];
    
    friendsinfolist.name=[friendsarray valueForKey:@"name"];
    friendsinfolist.icron=[friendsarray valueForKey:@"icron"];
    friendsinfolist.content=[friendsarray valueForKey:@"content"];
    friendsinfolist.time=[friendsarray valueForKey:@"time"];
    friendsinfolist.imagecontent=[friendsarray valueForKey:@"imagecontent"];
    friendsinfolist.comments=[friendsarray valueForKey:@"comments"];
    return friendsinfolist;
}
@end
