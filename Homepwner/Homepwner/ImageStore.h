//
//  ImageStore.h
//  Homepwner
//
//  Created by Asano Satoshi on 3/13/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ImageStore : NSObject
+(ImageStore *)defaultImageStore;
-(void)setImage:(UIImage *)image forKey:(NSString *)key;
-(UIImage *)imageForKey:(NSString *)key;
-(void)deleteImageForKey:(NSString *)key;
@end
