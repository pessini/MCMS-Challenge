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
@property NSString *creatureDescription;

-(instancetype)initWithName:(NSString *)name andDescription:(NSString *)creatureDescription;

@end
