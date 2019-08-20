//
//  CMSCard.h
//  DeckOfOneCard-C
//
//  Created by Apps on 8/20/19.
//  Copyright © 2019 Apps. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CMSCard : NSObject

@property (nonatomic, copy, readonly) NSString *suit;
@property (nonatomic, readonly) NSString *image;

- (instancetype)initWithSuit:(NSString *)suit image:(NSString *)image;

@end

@interface CMSCard (JSONConvertable)

- (instancetype)initWithDictionary:(NSDictionary <NSString *, NSString *>* )dictionary;

@end

NS_ASSUME_NONNULL_END
