//
//  AVPDataRecived.h
//  VicJazzFest
//
//  Created by albert vila puigvila on 02/04/14.
//  Copyright (c) 2014 albert vila. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AVPDataRecived : NSObject <NSCoding>

#pragma mark - Properties
@property (nonatomic, strong) NSString         *nameGroup;
@property (nonatomic, strong) NSString         *dateShow;
@property (nonatomic, strong) NSString         *description;
@property (nonatomic, strong) NSString         *place;
@property (nonatomic, strong) NSString         *linkToWeb;
@property (nonatomic, strong) NSString         *linkToYoutube;
@property (nonatomic, strong) NSString         *imgUrl;

#pragma mark - Data Content
@property (nonatomic, strong) NSDictionary     *dicData;
@property (nonatomic, strong) NSArray          *imgArray;
@property (strong, nonatomic) NSMutableArray   *arrayBands;

@property (nonatomic, assign) BOOL isCompletion;

- (id)init;

#pragma mark - Functions Load/Save
- (BOOL)saveData:(NSObject*)obj toFile:(NSString*)filename;
- (NSObject *)loadData:(NSString*)filename;
- (void)start;



@end
