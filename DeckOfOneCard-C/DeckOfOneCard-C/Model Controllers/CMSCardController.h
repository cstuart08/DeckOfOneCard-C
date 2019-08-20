//
//  CMSCardController.h
//  DeckOfOneCard-C
//
//  Created by Apps on 8/20/19.
//  Copyright © 2019 Apps. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CMSCard.h"

NS_ASSUME_NONNULL_BEGIN

@interface CMSCardController : NSObject

+ (CMSCardController *)shared;

- (void)drawANewCard:(NSInteger)card completion:(void (^) (NSArray<CMSCard *> *cards, NSError *error))completion;

@end

NS_ASSUME_NONNULL_END
