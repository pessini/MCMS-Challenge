//
//  BattleViewController.m
//  MCMS
//
//  Created by Leandro Pessini on 3/17/15.
//  Copyright (c) 2015 Brazuca Labs. All rights reserved.
//

#import "BattleViewController.h"

@interface BattleViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *opponentOneImageView;
@property (weak, nonatomic) IBOutlet UIImageView *opponentTwoImageView;
@property (weak, nonatomic) IBOutlet UIImageView *winnerImageView;
@property (weak, nonatomic) IBOutlet UILabel *winnerLabel;

@end

@implementation BattleViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    MagicalCreature *winner = [self startsBattleBetween:self.opponentOne and:self.opponentTwo];

    self.winnerLabel.text = winner.name;

    if (![self.opponentOne.imageName isEqualToString:@""]) {
        [self.opponentOneImageView setImage:[UIImage imageNamed:self.opponentOne.imageName]];
    }

    if (![self.opponentTwo.imageName isEqualToString:@""]) {
        [self.opponentTwoImageView setImage:[UIImage imageNamed:self.opponentTwo.imageName]];
    }

    if (![winner.imageName isEqualToString:@""]) {
        [self.winnerImageView setImage:[UIImage imageNamed:winner.imageName]];
    }
}

#pragma mark -IBAction

- (IBAction)onCloseButtonTapped:(UIButton *)sender {
    [[self presentingViewController] dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark -Helper Method

-(MagicalCreature *)startsBattleBetween: (MagicalCreature *)opponentOne and: (MagicalCreature *)opponentTwo
{

    NSNumber *bestAccessoryOpponentOne = [opponentOne.accessories valueForKeyPath:@"@max.intValue"];
    NSNumber *bestAccessoryOpponentTwo = [opponentTwo.accessories valueForKeyPath:@"@max.intValue"];

    if (bestAccessoryOpponentOne > bestAccessoryOpponentTwo)
    {
        return opponentOne;
    }
    else
    {
        return opponentTwo;
    }

}


@end
