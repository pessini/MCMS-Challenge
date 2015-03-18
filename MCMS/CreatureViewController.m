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
@property (weak, nonatomic) IBOutlet UITextField *textFieldCreatureName;

@end

@implementation CreatureViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = self.creature.name;
    self.labelCreatureName.text = self.creature.name;

    // hide the textField
    self.textFieldCreatureName.hidden = true;

}

#pragma mark -IBAction

- (IBAction)onEditButtonTapped:(UIBarButtonItem *)sender
{

    if ([sender.title isEqualToString:@"Edit"])
    {
        sender.title = @"Done";
        self.textFieldCreatureName.hidden = false;
        self.textFieldCreatureName.text = self.creature.name;
        [self.textFieldCreatureName becomeFirstResponder];
    }
    else
    {
        sender.title = @"Edit";

        if ([self.textFieldCreatureName.text length] > 0)
        {
            self.creature.name = self.textFieldCreatureName.text;
            self.labelCreatureName.text = self.creature.name;
        }

        [self.textFieldCreatureName resignFirstResponder];

        self.textFieldCreatureName.hidden = true;
    }

}


@end
