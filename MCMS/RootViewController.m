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

@interface RootViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UITextField *textFieldCreatureName;
@property (weak, nonatomic) IBOutlet UITextField *textFieldCreatureDescription;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    MagicalCreature *creatureOne = [[MagicalCreature alloc] initWithName:@"Spider Man" andDescription:@"Spider man"];
    MagicalCreature *creatureTwo = [[MagicalCreature alloc] initWithName:@"Super Man" andDescription:@"Super man"];
    MagicalCreature *creatureThree = [[MagicalCreature alloc] initWithName:@"Batman" andDescription:@"Batman"];

    self.creatures = [NSMutableArray arrayWithObjects:creatureOne,creatureTwo,creatureThree, nil];

    for (MagicalCreature *creature in self.creatures)
    {
        NSLog(@"%@", creature.name);
    }
}

#pragma mark -UITableViewDataSource

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"CreatureCell"];
    cell.textLabel.text = [[self.creatures objectAtIndex:indexPath.row] name];
    cell.detailTextLabel.text = [[self.creatures objectAtIndex:indexPath.row] creatureDescription];
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

        MagicalCreature *newCreature = [[MagicalCreature alloc] initWithName:self.textFieldCreatureName.text andDescription:self.textFieldCreatureDescription.text];
        [self.creatures addObject:newCreature];
        [self.tableView reloadData];

        // clear the textFields
        self.textFieldCreatureName.text = nil;
        self.textFieldCreatureDescription.text = nil;

        [self.textFieldCreatureName resignFirstResponder];

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

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(UITableViewCell *)cell
{
    NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
    MagicalCreature *creatureToSend = [self.creatures objectAtIndex:indexPath.row];
    CreatureViewController *vc = segue.destinationViewController;
    vc.creature = creatureToSend;
    vc.title = creatureToSend.name;
}


@end
