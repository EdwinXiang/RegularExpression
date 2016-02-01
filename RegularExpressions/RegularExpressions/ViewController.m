//
//  ViewController.m
//  RegularExpressions
//
//  Created by Edwin on 16/2/1.
//  Copyright © 2016年 EdwinXiang. All rights reserved.
//

#import "ViewController.h"
#import "XWTableViewCell.h"
#import "XWViewController.h"
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
/**
 *  数据源
 */
@property (nonatomic,strong) NSMutableArray *dataArr;
@end

@implementation ViewController
-(NSMutableArray *)dataArr{
    if (!_dataArr) {
        _dataArr = [[NSMutableArray alloc]initWithObjects:@"电话号码",@"邮箱",@"网页地址",@"全数字",@"身份证号码",@"全英文字符",@"IP地址",@"用户密码",@"汉字", nil];
    }
    return _dataArr;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.tableFooterView = [[UIView alloc]init];
    //注册 有xib的情况下
    [_tableView registerNib:[UINib nibWithNibName:@"XWTableViewCell"bundle:nil] forCellReuseIdentifier:@"xiangwei"];

}

#pragma mark --UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    XWTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"xiangwei" forIndexPath:indexPath];
    
    cell.titleLabel.text = [NSString stringWithFormat:@"%@",self.dataArr[indexPath.row]];
    return cell;
}
#pragma mark --UITableViewDelegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    XWViewController *regularVc = [[XWViewController alloc]init];
    switch (indexPath.row) {
        case 0:
            regularVc.type = RegularExpressionTypePhone;
            break;
        case 1:
            regularVc.type = RegularExpressionTypeEmail;
            break;
        case 2:
            regularVc.type = RegularExpressionTypeUrl;
            break;
        case 3:
            regularVc.type = RegularExpressionTypeAllNumber;
            break;
        case 4:
            regularVc.type = RegularExpressionTypeIDCardVc;
            break;
        case 5:
            regularVc.type = RegularExpressionTypeEnglishAlphabetVc;
            break;
        case 6:
            regularVc.type = RegularExpressionTypeIPAddress;
            break;
        case 7:
            regularVc.type = RegularExpressionTypeuserPsswordVc;
            break;
        default:
            regularVc.type = RegularExpressionTypeChinese;
            break;
    }
    [self.navigationController pushViewController:regularVc animated:YES];
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
