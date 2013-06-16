//
//  CardChooserViewController.m
//  CardViewer
//
//  Created by Mads Bielefeldt on 02/06/13.
//  Copyright (c) 2013 GN Resound. All rights reserved.
//

#import "CardChooserViewController.h"
#import "CardDisplayViewController.h"

@interface CardChooserViewController ()

@property (weak, nonatomic) IBOutlet UILabel *rankLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *suitSegmentedControl;

@property (nonatomic) NSUInteger rank;
@property (nonatomic, readonly) NSString *suit;

@end

@implementation CardChooserViewController

@synthesize rank = _rank;

- (NSString *)suit
{
    return [ self.suitSegmentedControl titleForSegmentAtIndex:[self.suitSegmentedControl selectedSegmentIndex]];
}

- (NSString *)rankAsString:(NSUInteger)rank
{
    return @[@"?",@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"][rank];
}

- (NSUInteger)rank
{
    if (!_rank) _rank = 1;
    return _rank;
}
- (IBAction)jhgffjhg:(id)sender {
}

- (void) setRank:(NSUInteger)rank
{
    _rank = rank;
    self.rankLabel.text = [self rankAsString:rank];
}

- (IBAction)changeRank:(UISlider *)sender
{
    self.rank = round(sender.value); 
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"ShowCard"])
    {
        if ([segue.destinationViewController isKindOfClass:[CardDisplayViewController class]])
        {
            CardDisplayViewController *cdvc = (CardDisplayViewController *)segue.destinationViewController;
            
            cdvc.rank = self.rank;
            cdvc.suit = self.suit;
            cdvc.title = [[self rankAsString:self.rank] stringByAppendingString:self.suit];
        }
    }
}

@end
