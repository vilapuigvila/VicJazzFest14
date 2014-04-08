//
//  AVPDataRecived.m
//  VicJazzFest
//
//  Created by albert vila puigvila on 02/04/14.
//  Copyright (c) 2014 albert vila. All rights reserved.
//

#import "AVPDataRecived.h"
#import <AFNetworking/AFNetworking.h>


@implementation AVPDataRecived

- (id)init{
    
    self = [super init];
    if (self) {
        
        //[self start];
        
    }
    return self;
}

-(void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.nameGroup     forKey:@"nameGroup"];
    [aCoder encodeObject:self.dateShow      forKey:@"dateShow"];
    [aCoder encodeObject:self.description   forKey:@"description"];
    [aCoder encodeObject:self.place         forKey:@"place"];
    [aCoder encodeObject:self.linkToWeb     forKey:@"linkToWeb"];
    [aCoder encodeObject:self.linkToYoutube forKey:@"linkToYoutube"];
    [aCoder encodeObject:self.imgUrl        forKey:@"imgUrl"];
    [aCoder encodeObject:self.dicData       forKey:@"dicData"];
    [aCoder encodeObject:self.imgArray      forKey:@"imgArray"];

}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self)
    {
        self.nameGroup = [aDecoder decodeObjectForKey:@"nameGroup"];
        self.nameGroup = [aDecoder decodeObjectForKey:@"dateShow"];
        self.nameGroup = [aDecoder decodeObjectForKey:@"description"];
        self.nameGroup = [aDecoder decodeObjectForKey:@"place"];
        self.nameGroup = [aDecoder decodeObjectForKey:@"linkToWeb"];
        self.nameGroup = [aDecoder decodeObjectForKey:@"linkToYoutube"];
        self.nameGroup = [aDecoder decodeObjectForKey:@"imgUrl"];
        self.dicData   = [aDecoder decodeObjectForKey:@"dicData"];
        self.imgArray   = [aDecoder decodeObjectForKey:@"imgArray"];
    }
    return self;
}
- (NSString*) getOfflinePathForFilename:(NSString*)filename
{
    return [[ECommon documentsPath] stringByAppendingPathComponent:filename];
}
- (NSObject*)loadData:(NSString*)filename
{
    NSData *theData = [NSData dataWithContentsOfFile:[ECommon getOfflinePathForFilename:filename]];
    NSKeyedUnarchiver *decoder = [[NSKeyedUnarchiver alloc] initForReadingWithData:theData];
    return [decoder decodeObjectForKey:@"Data"];
}

-(BOOL)saveData:(NSObject*)obj toFile:(NSString*)filename
{
    NSMutableData *theData = [NSMutableData data];
    NSKeyedArchiver *encoder = [[NSKeyedArchiver alloc] initForWritingWithMutableData:theData];
    [encoder encodeObject:obj forKey:@"Data"];
    [encoder finishEncoding];
    return [theData writeToFile:[ECommon getOfflinePathForFilename:filename] atomically:YES];
}
-(void)start
{
    NSURL *url = [NSURL URLWithString:URL_JSON_SHOWS];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc]initWithRequest:request];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         self.isCompletion = NO;
         NSError *error = nil;
         self.dicData = [NSJSONSerialization JSONObjectWithData:operation.responseData
                                                        options:kNilOptions error:&error];
         
         //--Check if exits old data or is update
         NSDictionary *oldDic = (NSDictionary*)[self loadData:PATH_NSCODING];
         NSArray *old = oldDic[@"bands"];
         NSArray *newData = self.dicData[@"bands"];
         
         BOOL isChanged = NO;
         
         if (oldDic.count > 0 && old.count > 0) {
             isChanged = [ECommon compareArrayIgnoreIndexes:newData toArray:old];
             //[ECommon compareArrayIgnoreIndexes:(NSArray*)[self loadData:PATH_NSCODING_IMG] toArray:[self turnUrlIntoNsdata]];
         }
         
         //--Get First Data Images
         NSMutableArray *aArray = [NSMutableArray array];
         
         for (NSDictionary *dic in newData) {
             NSString *str = dic[@"image"];
             NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:str]];
             UIImage *aImg = [UIImage imageWithData:data];
             [aArray addObject:aImg];
         }
         
         //--Storage All Data Recived
         if (oldDic == nil) {
             self.imgArray = [[NSArray arrayWithArray:aArray]copy];
             [self saveData:self.imgArray toFile:PATH_NSCODING_IMG];
             [self saveData:self.dicData toFile:PATH_NSCODING];
             NSLog(@"WE HAVE KEPT STORAGE DATA INTO HARD DISK");
         }
         if (isChanged) {
             [self saveData:self.dicData toFile:PATH_NSCODING];
         }
         self.isCompletion = YES;
         
     } failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
         
     }];
    [operation start];
}
/*-(void)createDataFromJson{
    
    self.arrayBands = [NSMutableArray array];
    
    NSArray *d = self.dicData[@"bands"];
    AVPDataRecived *data = [[AVPDataRecived alloc]init];
    
}*/
























@end
