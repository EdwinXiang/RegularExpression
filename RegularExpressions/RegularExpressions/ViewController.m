//
//  ViewController.m
//  RegularExpressions
//
//  Created by Edwin on 16/2/1.
//  Copyright © 2016年 EdwinXiang. All rights reserved.
//

#import "ViewController.h"

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
        _dataArr = [[NSMutableArray alloc]initWithObjects:@"电话号码",@"邮箱",@"网页地址",@"全数字",@"身份证号码",@"全英文字符",@"IP地址",@"用户密码",@"汉字",@"文字高亮显示", nil];
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
    XWTextHightViewController *textVc = [[XWTextHightViewController alloc]init];
        switch (indexPath.row) {
            case 0:
                regularVc.type = RegularExpressionTypePhone;
                [self.navigationController pushViewController:regularVc animated:YES];
                break;
            case 1:
                regularVc.type = RegularExpressionTypeEmail;
                [self.navigationController pushViewController:regularVc animated:YES];
                break;
            case 2:
                regularVc.type = RegularExpressionTypeUrl;
                [self.navigationController pushViewController:regularVc animated:YES];
                break;
            case 3:
                regularVc.type = RegularExpressionTypeAllNumber;
                [self.navigationController pushViewController:regularVc animated:YES];
                break;
            case 4:
                regularVc.type = RegularExpressionTypeIDCardVc;
                [self.navigationController pushViewController:regularVc animated:YES];
                break;
            case 5:
                regularVc.type = RegularExpressionTypeEnglishAlphabetVc;
                [self.navigationController pushViewController:regularVc animated:YES];
                break;
            case 6:
                regularVc.type = RegularExpressionTypeIPAddress;
                [self.navigationController pushViewController:regularVc animated:YES];
                break;
            case 7:
                regularVc.type = RegularExpressionTypeuserPsswordVc;
                [self.navigationController pushViewController:regularVc animated:YES];
                break;
            case 8:
                regularVc.type = RegularExpressionTypeChinese;
                [self.navigationController pushViewController:regularVc animated:YES];
                break;
                
            default:
                [self.navigationController pushViewController:textVc animated:YES];
                break;
                
        }
    

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
