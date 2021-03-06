//
//  CreatureViewController.m
//  MCMS
//
//  Created by Leandro Pessini on 3/17/15.
//  Copyright (c) 2015 Brazuca Labs. All rights reserved.
//

#import "CreatureViewController.h"

@interface CreatureViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UILabel *labelCreatureName;
@property (weak, nonatomic) IBOutlet UILabel *labelCreatureDetail;
@property (weak, nonatomic) IBOutlet UIImageView *imageViewCreature;
@property (weak, nonatomic) IBOutlet UITextField *textFieldCreatureName;
@property (weak, nonatomic) IBOutlet UITextField *textFieldCreatureDetail;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation CreatureViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = self.creature.name;
    self.labelCreatureName.text = self.creature.name;
    self.labelCreatureDetail.text = self.creature.detail;

//    NSLog(@"%@", self.creature.imageName);

    if (![self.creature.imageName isEqualToString:@""]) {
        [self.imageViewCreature setImage:[UIImage imageNamed:self.creature.imageName]];
    }

    // hide the textField
    self.textFieldCreatureName.hidden = true;
    self.textFieldCreatureDetail.hidden = true;

}   

#pragma mark -IBAction

- (IBAction)onEditButtonTapped:(UIBarButtonItem *)sender
{

    if ([sender.title isEqualToString:@"Edit"])
    {
        sender.title = @"Done";
        self.textFieldCreatureName.hidden = false;
        self.textFieldCreatureDetail.hidden = false;

        self.textFieldCreatureName.text = self.creature.name;
        self.textFieldCreatureDetail.text = self.creature.detail;

        self.textFieldCreatureDetail.hidden = false;
        self.textFieldCreatureDetail.text = self.creature.detail;

        [self.textFieldCreatureName becomeFirstResponder];
    }
    else
    {
        sender.title = @"Edit";

        if ([self.textFieldCreatureName.text length] > 0)
        {
            self.creature.name = self.textFieldCreatureName.text;
            self.labelCreatureName.text = self.creature.name;

            self.creature.detail = self.textFieldCreatureDetail.text;
            self.labelCreatureDetail.text = self.creature.detail;
        }

        [self.textFieldCreatureName resignFirstResponder];

        self.textFieldCreatureName.hidden = true;
        self.textFieldCreatureDetail.hidden = true;
    }

}

#pragma mark -UITableViewDataSource

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"AccessoryCell"];
    cell.textLabel.text = [NSString stringWithFormat:@"Accessory Power - %@",[self.creature.accessories objectAtIndex:indexPath.row]];

    return cell;

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.creature.accessories.count;
}


@end
