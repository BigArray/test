//
//  ViewController.m
//  md5
//
//  Created by 张振飞 on 17/4/17.
//  Copyright © 2017年 zzf. All rights reserved.
//

#import "ViewController.h"
#import <CommonCrypto/CommonDigest.h>
#import "SenViewController.h"
#import "MCell.h"

#define Width self.view.frame.size.width
#define Height self.view.frame.size.height

@interface ViewController ()<UICollectionViewDelegate, UICollectionViewDataSource>
@property (nonatomic, strong)UICollectionView *addressCollection;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    
//    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(100, 200, 200, 80)];
//    label.center = self.view.center;
//    label.backgroundColor = [UIColor redColor];
//    label.text = @"click to next";
//    label.textAlignment = 1;
//    label.textColor = [UIColor whiteColor];
//    label.font = [UIFont systemFontOfSize:20];
//    [self.view addSubview:label];
//    
//    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapLabel:)];
//    label.userInteractionEnabled = YES;
//    [label addGestureRecognizer:tap];
//    
//    NSString *result = [self md5:@"zzf"];
//    
//    NSLog(@"------%@-----", result);
//    
//    [self practice:@"aaa" cb:^(NSString *str, CGFloat a) {
//        NSLog(@"%@---%.f", str, a);
//    }];
//    
//    
//    NSLog(@"aaaaaaaaaa");
    
//    NSMutableString * str = [[NSMutableString alloc] initWithFormat:@"123"];
//    NSLog(@"str = %p",str);
//    [str appendFormat:@"456"];
//    NSLog(@"str = %p",str);

    NSMutableDictionary * dic = [[NSMutableDictionary alloc] initWithObjectsAndKeys:@"1",@"2",@"2",@"3",@"3",@"4", nil];
    NSArray *arr = [[NSArray alloc] initWithArray:[dic allKeys]];
    NSLog(@"%@--", arr);
    NSString *str = [[NSString alloc] initWithFormat:[arr objectAtIndex:0],[arr objectAtIndex:1],[arr objectAtIndex:2]];
    NSLog(@"%@",str);

    [self createCollection];
    
}

- (void)createCollection{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = CGSizeMake((Width-2)/3, (Height-108)/3);
    layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
    layout.minimumLineSpacing = 1;
    layout.minimumInteritemSpacing = 0;
    
    
    _addressCollection = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, Width, Height-108) collectionViewLayout:layout];
    _addressCollection.scrollEnabled = NO;
    _addressCollection.backgroundColor = [UIColor whiteColor];
    _addressCollection.delegate = self;
    _addressCollection.dataSource = self;
    _addressCollection.alwaysBounceVertical = YES;
    [self.view addSubview:_addressCollection];
    
    [_addressCollection registerClass:[MCell class] forCellWithReuseIdentifier:@"type"];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 9;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    MCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"type" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor redColor];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *str = [NSString stringWithFormat:@"点击了第%ld个", (long)indexPath.row + 1];
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:str preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
    }];
    UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
        NSLog(@"quxiao ");
    }];
    
    [alert addAction:action1];
    [alert addAction:action2];

    [self presentViewController:alert animated:YES completion:nil];
}


- (void)tapLabel:(UITapGestureRecognizer *)tp{
    SenViewController *sec = [[SenViewController alloc] init];
    sec.mb = ^(NSString *taskId) {
        NSLog(@"hhh");
    };

    sec.sumbitAllDate = ^(NSString *taskId) {
        NSLog(@"jjj");
    };
    [self.navigationController pushViewController:sec animated:YES];
}

- (NSString *) md5:(NSString *) input {
    const char *cStr = [input UTF8String];
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    CC_MD5( cStr, strlen(cStr), digest ); // This is the md5 call  d41d8cd98f00b204e9800998ecf8427e
    
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
        [output appendFormat:@"%02x", digest[i]];
    
    return  output;
}

- (void)practice:(NSString *)str cb:(void (^)(NSString * , CGFloat))cp{
    cp([str stringByAppendingString:@"hao"], 2);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
