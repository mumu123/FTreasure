//
//  SelectBonusViewController.h
//  WinTreasure
//
//  Created by Apple on 16/6/21.
//  Copyright © 2016年 linitial. All rights reserved.
//

#import "BaseViewController.h"

typedef void(^SelectBonusBlock)(NSInteger bonusCount);

@interface SelectBonusViewController : BaseViewController

@property (nonatomic, copy) SelectBonusBlock chooseBonus;

@property (nonatomic, strong) NSMutableArray *datasource;

@end
