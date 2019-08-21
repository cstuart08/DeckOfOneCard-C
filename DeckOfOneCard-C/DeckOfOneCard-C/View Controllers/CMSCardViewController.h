//
//  CMSCardViewController.h
//  DeckOfOneCard-C
//
//  Created by Apps on 8/20/19.
//  Copyright © 2019 Apps. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CMSCardController.h"
#import "CMSCard.h"

NS_ASSUME_NONNULL_BEGIN

@interface CMSCardViewController : UIViewController

//MARK: - Outlets

@property (weak, nonatomic) IBOutlet UILabel *suitLabel;
@property (weak, nonatomic) IBOutlet UIImageView *cardImageView;

//MARK: - Actions
- (IBAction)drawCardButton:(id)sender;

//MARK: - Properties

//MARK: - Methods
- (void)updateViewsWithCard;

@end

NS_ASSUME_NONNULL_END
