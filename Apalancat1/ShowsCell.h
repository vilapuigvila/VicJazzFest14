//
//  ShowsCell.h
//  VicJazzFest
//
//  Created by albert vila puigvila on 03/04/14.
//  Copyright (c) 2014 albert vila. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShowsCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
@property (weak, nonatomic) IBOutlet UILabel *lblSubTitle;

@property (weak, nonatomic) IBOutlet UIImageView *imgVwCell;
@property (weak, nonatomic) IBOutlet UILabel *lblDate;



@end
