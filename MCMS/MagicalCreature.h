//
//  MagicalCreature.h
//  MCMS
//
//  Created by Leandro Pessini on 3/17/15.
//  Copyright (c) 2015 Brazuca Labs. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface MagicalCreature : NSObject

@property NSString *name;
@property NSString *detail;
@property NSString *imageName;
@property NSArray *accessories;

-(instancetype)initWithName:(NSString *)name
                  andDetail:(NSString *)detail
                  andImageName:(NSString *)imageName
                  andAccessories:(NSArray *)accessories;

@end
