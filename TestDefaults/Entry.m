//
//  Entry.m
//  TestDefaults
//
//  Created by Chase Wasden on 1/14/15.
//  Copyright (c) 2015 Chase Wasden. All rights reserved.
//

#import "Entry.h"

static NSString * titleKey = @"titleKey";

@implementation Entry

-(NSDictionary *)toDictionary {
    return @{
             @"title":self.title,
             @"content":self.content
             };
}

-(void)updateWithDictionary:(NSDictionary *)dictionary {
    self.title = dictionary[titleKey];
    self.content = dictionary[@"content"];
}

+(Entry *)fromDictionary:(NSDictionary *)dictionary {
    Entry * entry = [Entry new];
    entry.title = dictionary[titleKey];
    entry.content = dictionary[@"content"];
    return entry;
}

@end
