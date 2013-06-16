//
//  CardDisplayViewController.m
//  CardViewer
//
//  Created by Mads Bielefeldt on 02/06/13.
//  Copyright (c) 2013 GN Resound. All rights reserved.
//

#import "CardDisplayViewController.h"
#import "PlayingCardView.h"

@interface CardDisplayViewController ()

@property (weak, nonatomic) IBOutlet PlayingCardView *playingCardView;

@end

@implementation CardDisplayViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.playingCardView.rank = self.rank;
    self.playingCardView.suit = self.suit;
    self.playingCardView.faceUp = YES;
}

@end
