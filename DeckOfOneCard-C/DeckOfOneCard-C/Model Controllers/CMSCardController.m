//
//  CMSCardController.m
//  DeckOfOneCard-C
//
//  Created by Apps on 8/20/19.
//  Copyright © 2019 Apps. All rights reserved.
//

#import "CMSCardController.h"
#import "CMSCard.h"
#import <UIKit/UIKit.h>

@implementation CMSCardController

+ (CMSCardController *) shared {
    static CMSCardController *shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [CMSCardController new];
    });
    return shared;
}


- (void)drawANewCard:(NSInteger)numberOfCards completion:(void (^)(NSArray<CMSCard *> * , NSError * _Nullable  ))completion {
    
    NSString *stringURL = @"https://deckofcardsapi.com/api/deck/47rykl3kqnqw/draw/";
    NSURL *baseULR = [NSURL URLWithString:stringURL];
    
    NSString *cardCount = [@(numberOfCards) stringValue];
    
    NSURLComponents *components = [NSURLComponents componentsWithURL:baseULR resolvingAgainstBaseURL:true];
    
    NSURLQueryItem *queryItem = [NSURLQueryItem queryItemWithName:@"count" value:cardCount];
    components.queryItems = @[queryItem];
    NSURL *searchURL = components.URL;
    
    
    
    [[NSURLSession.sharedSession dataTaskWithURL:searchURL completionHandler:^(NSData * data, NSURLResponse * response, NSError * error) {
        
        if (error) {
            NSLog(@"Error fetching a card: %@, %@", error, error.localizedDescription);
            completion(nil, error);
            return;
        }
        
        if (!data) {
            NSLog(@"Error fetching card DATA: %@", error);
            completion(nil, error);
            return;
        }
        
        NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        
        NSMutableArray<CMSCard *> *cardsPlaceholder = [[NSMutableArray alloc] init];
        
        NSArray *cardsArray = jsonDictionary[@"cards"];
        for (NSDictionary *cardDictionaries in cardsArray) {
            CMSCard *card = [[CMSCard alloc] initWithDictionary:cardDictionaries];
            [cardsPlaceholder addObject:card];
        }
        
        // Safety Check:
        if (!jsonDictionary || ![jsonDictionary isKindOfClass:[NSDictionary class]]) {
            NSLog(@"Error fetching JSON dictionary: %@", error);
            completion(nil, error);
            return;
        }
        
        completion(cardsPlaceholder, nil);
        
        
    }]resume];
}
- (void)fetchCardImage:(CMSCard *)card completion:(void (^)(UIImage *, NSError *))completion {
    
    NSURL *cardImageURL = [NSURL URLWithString:card.image];
    
    [[NSURLSession.sharedSession dataTaskWithURL:cardImageURL completionHandler:^(NSData * data, NSURLResponse * response, NSError * _Nullable error) {
        
        if (error) {
            NSLog(@"Error fetching a card: %@, %@", error, error.localizedDescription);
            completion(nil, error);
            return;
        }
        
        if (!data) {
            NSLog(@"Error fetching card DATA: %@", error);
            completion(nil, error);
            return;
        }
        
        UIImage *cardImage = [UIImage imageWithData:data];
        completion(cardImage, nil);
        
    }]resume];
    
    
}
@end
