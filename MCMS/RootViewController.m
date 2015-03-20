//
//  ViewController.m
//  MCMS
//
//  Created by Leandro Pessini on 3/17/15.
//  Copyright (c) 2015 Brazuca Labs. All rights reserved.
//

#import "RootViewController.h"
#import "MagicalCreature.h"
#import "CreatureViewController.h"
#import "BattleViewController.h"

@interface RootViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UITextField *textFieldCreatureName;
@property (weak, nonatomic) IBOutlet UITextField *textFieldCreatureDescription;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *battleButton;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    MagicalCreature *creatureOne = [[MagicalCreature alloc] initWithName:@"Creature 1"
                                                               andDetail:@"Creature 1 Details"
                                                            andImageName:@"creature_0"
                                                          andAccessories:[self randomAccessories]];

    MagicalCreature *creatureTwo = [[MagicalCreature alloc] initWithName:@"Creature 2"
                                                               andDetail:@"Creature 2 Details"
                                                            andImageName:@"creature_1"
                                                          andAccessories:[self randomAccessories]];

    MagicalCreature *creatureThree = [[MagicalCreature alloc] initWithName:@"Creature 3"
                                                               andDetail:@"Creature 3 Details"
                                                            andImageName:@"creature_2"
                                                          andAccessories:[self randomAccessories]];

    self.creatures = [NSMutableArray arrayWithObjects:creatureOne,creatureTwo,creatureThree, nil];

}

-(void)viewWillAppear:(BOOL)animated
{
    [self.tableView reloadData];
}

#pragma mark -UITableViewDataSource

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"CreatureCell"];
    cell.textLabel.text = [[self.creatures objectAtIndex:indexPath.row] name];
    cell.detailTextLabel.text = [[self.creatures objectAtIndex:indexPath.row] detail];


    return cell;

}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.creatures.count;
}

#pragma mark -IBAction

-(IBAction)onAddNewCreatureButtonTapped:(UIButton *)sender
{
    // check if there is any empty textField
    if ([self.textFieldCreatureName.text length] > 0
        || [self.textFieldCreatureDescription.text length] > 0)
    {
        // it's ok

        NSString *addImage = @"";
        // because I only have 15 images
        if (self.creatures.count <= 15)
        {
            addImage = [NSString stringWithFormat:@"creature_%lu", (unsigned long)self.creatures.count];
        }

        MagicalCreature *newCreature = [[MagicalCreature alloc] initWithName:self.textFieldCreatureName.text
                                                                   andDetail:self.textFieldCreatureDescription.text
                                                                andImageName:addImage
                                                              andAccessories:[self randomAccessories]];
        [self.creatures addObject:newCreature];
        [self.tableView reloadData];

        // clear the textFields
        self.textFieldCreatureName.text = nil;
        self.textFieldCreatureDescription.text = nil;

        if ([self.textFieldCreatureName isFirstResponder])
        {
            [self.textFieldCreatureName resignFirstResponder];
        }
        else
        {
            [self.textFieldCreatureDescription resignFirstResponder];
        }

    }
    else
    {
        UIAlertView *alertEmptyTextField = [[UIAlertView alloc] initWithTitle:@"Something wrong"
                                                                      message:@"All fields are required"
                                                                     delegate:self
                                                            cancelButtonTitle:nil
                                                            otherButtonTitles:@"Ok", nil];

        [alertEmptyTextField show];
    }
}

#pragma mark -Segue

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];

    if ([segue.identifier isEqualToString:@"ShowCreatureSegue"])
    {

        MagicalCreature *creatureToSend = [self.creatures objectAtIndex:indexPath.row];
        CreatureViewController *vc = segue.destinationViewController;
        vc.creature = creatureToSend;
        vc.title = creatureToSend.name;
    }
    else if ([segue.identifier isEqualToString:@"BattleSegue"])
    {
        BattleViewController *vc = segue.destinationViewController;
        vc.title = @"Battle";
        NSUInteger randomOpponentOne = arc4random_uniform((int32_t)self.creatures.count);
        NSUInteger randomOpponentTwo = arc4random_uniform((int32_t)self.creatures.count);
        while (randomOpponentOne == randomOpponentTwo)
        {
            randomOpponentTwo = arc4random_uniform((int32_t)self.creatures.count);
        }
        vc.opponentOne = [self.creatures objectAtIndex:randomOpponentOne];
        vc.opponentTwo = [self.creatures objectAtIndex:randomOpponentTwo];

    }
}

#pragma mark -Helper Methods

-(NSArray *)randomAccessories
{
    NSNumber *accessoryOne,*accessoryTwo,*accessoryThree;

    for (int i = 0; i <3; i++) {
        accessoryOne = [NSNumber numberWithInt: arc4random_uniform(100) + 1];
        accessoryTwo = [NSNumber numberWithInt: arc4random_uniform(100) + 1];
        accessoryThree = [NSNumber numberWithInt: arc4random_uniform(100) + 1];
    }

    NSArray *arrayWithAccessories = [[NSArray alloc] initWithObjects:accessoryOne, accessoryTwo, accessoryThree, nil];


    return arrayWithAccessories;
}


@end
