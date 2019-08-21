//
//  CMSCardController.h
//  DeckOfOneCard-C
//
//  Created by Apps on 8/20/19.
//  Copyright © 2019 Apps. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CMSCard;

@interface CMSCardController : NSObject

+ (CMSCardController *)shared;

- (void)drawANewCard:(NSInteger)numberOfCards completion:(void (^) (NSArray<CMSCard *> *cards, NSError *error))completion;

- (void)fetchCardImage:(CMSCard *)card completion:(void (^) (UIImage *image, NSError *error))completion;

@end
