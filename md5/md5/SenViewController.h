//
//  SenViewController.h
//  md5
//
//  Created by 张振飞 on 17/4/18.
//  Copyright © 2017年 zzf. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^mybloc)(NSString *str);
typedef void(^SumbitAllDate)(NSString *taskId);

@interface SenViewController : UIViewController
@property (nonatomic, copy)mybloc mb;
@property (copy, nonatomic) SumbitAllDate sumbitAllDate;
@end
