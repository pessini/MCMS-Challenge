//
//  MagicalCreature.m
//  MCMS
//
//  Created by Leandro Pessini on 3/17/15.
//  Copyright (c) 2015 Brazuca Labs. All rights reserved.
//

#import "MagicalCreature.h"

@implementation MagicalCreature

-(instancetype)initWithName:(NSString *)name andDetail:(NSString *)detail andImageName:(NSString *)imageName andAccessories:(NSArray *)accessories
{
    self = [super init];

    if (self)
    {
        self.name = name;
        self.detail = detail;
        self.imageName = imageName;
        self.accessories = accessories;
    }

    return self;
}

@end
