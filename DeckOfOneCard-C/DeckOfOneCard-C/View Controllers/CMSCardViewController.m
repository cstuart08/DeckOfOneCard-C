//
//  CMSCardViewController.m
//  DeckOfOneCard-C
//
//  Created by Apps on 8/20/19.
//  Copyright © 2019 Apps. All rights reserved.
//

#import "CMSCardViewController.h"
#import "CMSCardController.h"


@interface CMSCardViewController ()

@end

@implementation CMSCardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)drawCardButton:(id)sender {
    [self updateViewsWithCard];
    
    
}

- (void)updateViewsWithCard {
    if (self != nil) {
        
        [CMSCardController.shared drawANewCard:1 completion:^(NSArray<CMSCard *> *cards, NSError *error) {
            if (!cards) {
                return;
            }
            
            CMSCard *card = [cards objectAtIndex:0];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                self.suitLabel.text = card.suit;
            });
            
            [CMSCardController.shared fetchCardImage:card completion:^(UIImage *image, NSError *error) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    self.cardImageView.image = image;
                });
            }];
            
        }];
    }
}
@end
