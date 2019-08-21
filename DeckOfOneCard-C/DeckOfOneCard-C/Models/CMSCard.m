//
//  CMSCard.m
//  DeckOfOneCard-C
//
//  Created by Apps on 8/20/19.
//  Copyright © 2019 Apps. All rights reserved.
//

#import "CMSCard.h"

// Magic Strings
static NSString * const suitKey = @"suit";
static NSString * const imageKey = @"image";
static NSString * const cardsKey = @"cards";

@implementation CMSCard

- (instancetype)initWithSuit:(NSString *)suit image:(NSString *)image {
    
    self = [super init];
    
    if (self != nil) {
        _suit = suit;
        _image = image;
    }
    return self;
}

@end

@implementation CMSCard (JSONConvertable)

- (instancetype)initWithDictionary:(NSDictionary<NSString *,NSString *> *)dictionary {
    
    NSString *suitName = dictionary[suitKey];
    NSString *imageName = dictionary[imageKey];

    return [self initWithSuit:suitName image:imageName];
    
}

@end
