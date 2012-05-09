//
//  ImageStore.m
//  Homepwner
//
//  Created by Asano Satoshi on 3/13/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ImageStore.h"
@interface ImageStore() {
    NSMutableDictionary *_dictionary;
}
@end

@implementation ImageStore
static ImageStore *defaultImageStore = nil;

+(id)defaultImageStore {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        defaultImageStore = [[super allocWithZone:NULL] init];
    });
    return defaultImageStore;
}

+(id)allocWithZone:(NSZone *)zone {
    return [self defaultImageStore];
}

-(id)init {
    if (defaultImageStore) {
        return defaultImageStore;
    }
    self = [super init];
    if (self) {
        _dictionary = [[NSMutableDictionary alloc] init];
    }
    return self;
}

-(void)setImage:(UIImage *)image forKey:(NSString *)key {
    [_dictionary setObject:image forKey:key];
}

-(UIImage *)imageForKey:(NSString *)key {
    return [_dictionary objectForKey:key];
}

-(void)deleteImageForKey:(NSString *)key {
    if (!key) 
        return;

    [_dictionary removeObjectForKey:key];
}

@end
