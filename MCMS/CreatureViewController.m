//
//  CreatureViewController.m
//  MCMS
//
//  Created by Leandro Pessini on 3/17/15.
//  Copyright (c) 2015 Brazuca Labs. All rights reserved.
//

#import "CreatureViewController.h"

@interface CreatureViewController ()
@property (weak, nonatomic) IBOutlet UILabel *labelCreatureName;

@end

@implementation CreatureViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.labelCreatureName.text = self.creature.name;
    
}


@end
