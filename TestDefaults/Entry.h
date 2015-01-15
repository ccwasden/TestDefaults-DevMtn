//
//  Entry.h
//  TestDefaults
//
//  Created by Chase Wasden on 1/14/15.
//  Copyright (c) 2015 Chase Wasden. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Entry : NSObject

@property (nonatomic, strong) NSString * title;
@property (nonatomic, strong) NSString * content;

-(NSDictionary *)toDictionary;
-(void)updateWithDictionary:(NSDictionary *)dictionary;

+(Entry *)fromDictionary:(NSDictionary *)dictionary;

@end
