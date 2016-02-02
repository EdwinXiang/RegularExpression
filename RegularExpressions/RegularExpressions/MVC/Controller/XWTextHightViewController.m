//
//  XWTextHightViewController.m
//  RegularExpressions
//
//  Created by Edwin on 16/2/1.
//  Copyright © 2016年 EdwinXiang. All rights reserved.
//

#import "XWTextHightViewController.h"

@interface XWTextHightViewController ()<UITextViewDelegate,UITextFieldDelegate>
/**
 *  输入正常的字符串
 */
@property (nonatomic,strong) UITextView *normalTextView;
/**
 *  输入需要高亮显示的文字
 */
@property (nonatomic,strong) UITextField *hightlightTextField;
/**
 *  显示高亮显示的结果
 */
@property (nonatomic,strong) UILabel *resultLabel;

@property (nonatomic,copy) NSString *normalStr;

@property (nonatomic,strong) NSAttributedString *attributeStr;

@end

@implementation XWTextHightViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.normalTextView becomeFirstResponder];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
    self.title = @"文字高亮显示";
    UILabel *labelS = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 20)];
    labelS.backgroundColor = [UIColor clearColor];
    [self.view addSubview:labelS];
    //输入框
    _normalTextView = [[UITextView alloc]initWithFrame:CGRectMake(20,79,ScreenWidth-40,200)];
    _normalTextView.layer.cornerRadius = 5;
    _normalTextView.delegate = self;
    _normalTextView.font = [UIFont systemFontOfSize:14.0f];
    _normalTextView.textColor = [UIColor blackColor];
    _normalTextView.returnKeyType = UIReturnKeyDone;
    _normalTextView.keyboardType = UIKeyboardTypeDefault;
    _normalTextView.autocorrectionType = UITextAutocorrectionTypeYes; //开启自动纠错
    _normalTextView.editable = YES;
    _normalTextView.scrollEnabled = YES;
    _normalTextView.showsHorizontalScrollIndicator = NO;
    _normalTextView.showsVerticalScrollIndicator = NO;
    _normalTextView.delegate = self;
    
    [self.view addSubview:_normalTextView];
    
    _hightlightTextField = [[UITextField alloc]initWithFrame:CGRectMake(CGRectGetMinX(self.normalTextView.frame)+10, CGRectGetMaxY(self.normalTextView.frame)+10,CGRectGetWidth(self.normalTextView.frame)-20, 32)];
    _hightlightTextField.borderStyle = UITextBorderStyleRoundedRect;
    _hightlightTextField.backgroundColor = [UIColor whiteColor];
    _hightlightTextField.textAlignment = NSTextAlignmentLeft;
    _hightlightTextField.placeholder = @"请输入高亮显示的字符串";
    _hightlightTextField.font = [UIFont systemFontOfSize:14];
    _hightlightTextField.textColor = [UIColor blackColor];
    _hightlightTextField.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
    _hightlightTextField.returnKeyType = UIReturnKeyNext;
    _hightlightTextField.clearsOnBeginEditing = YES;
    _hightlightTextField.adjustsFontSizeToFitWidth = YES;
    _hightlightTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;//设置对齐方式
    _hightlightTextField.delegate = self;
    [self.view addSubview:_hightlightTextField];
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMinX(_normalTextView.frame), CGRectGetMaxY(_hightlightTextField.frame)+10,50, 30)];
    label.text = @"结果:";
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont systemFontOfSize:14.0f];
    [self.view addSubview:label];
    
    self.resultLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMinX(label.frame), CGRectGetMaxY(label.frame)+5, CGRectGetWidth(_normalTextView.frame), 100)];
    self.resultLabel.layer.borderWidth = 1;
    self.resultLabel.layer.borderColor = [UIColor blackColor].CGColor;
    self.resultLabel.layer.cornerRadius = 5;
    self.resultLabel.layer.masksToBounds = YES;
    self.resultLabel.adjustsFontSizeToFitWidth = YES;
    self.resultLabel.backgroundColor = [UIColor whiteColor];
    self.resultLabel.numberOfLines = 0;
    self.resultLabel.textAlignment = NSTextAlignmentLeft;
    self.resultLabel.font = [UIFont systemFontOfSize:14.0];
    [self.view addSubview:self.resultLabel];
    
    
}
#pragma mark --UITextFieldDelegate
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    //收起键盘
    [self.hightlightTextField resignFirstResponder];
    NSString *inputText = textField.text;
    NSLog(@"%@---%@",self.normalStr,inputText);
    self.attributeStr = [self attributedTextWithText:self.normalStr withPattern:inputText];
    self.resultLabel.attributedText = self.attributeStr;

    return YES;
}

#pragma mark --textViewDeleagate
-(BOOL)textViewShouldEndEditing:(UITextView *)textView{
    
    self.normalStr = textView.text;
    NSLog(@"----------------%@",self.normalStr);
        return YES;
}

-(NSAttributedString *)attributedTextWithText:(NSString *)text withPattern:(NSString *)pattern{
    NSMutableAttributedString *attributedText = [[NSMutableAttributedString alloc] init];
//    // 表情的规则
//    NSString *emotionPattern = @"\\[[0-9a-zA-Z\\u4e00-\\u9fa5]+\\]";
//    // @的规则
//    NSString *atPattern = @"@[0-9a-zA-Z\\u4e00-\\u9fa5-_]+";
//    // #话题#的规则
//    NSString *topicPattern = @"#[0-9a-zA-Z\\u4e00-\\u9fa5]+#";
//    // url链接的规则
//    NSString *urlPattern = @"\\b(([\\w-]+://?|www[.])[^\\s()<>]+(?:\\([\\w\\d]+\\)|([^[:punct:]\\s]|/)))";
//    NSString *pattern = [NSString stringWithFormat:@"%@|%@|%@|%@", emotionPattern, atPattern, topicPattern, urlPattern];
    
    // 遍历所有的特殊字符串
    NSMutableArray *parts = [NSMutableArray array];
    [text enumerateStringsMatchedByRegex:pattern usingBlock:^(NSInteger captureCount, NSString *const __unsafe_unretained *capturedStrings, const NSRange *capturedRanges, volatile BOOL *const stop) {
        if ((*capturedRanges).length == 0) return;
        
        XWTextPart *part = [[XWTextPart alloc] init];
        part.text = *capturedStrings;
        part.special = YES;
        part.range = *capturedRanges;
        [parts addObject:part];
    }];
    // 遍历所有的非特殊字符
    [text enumerateStringsSeparatedByRegex:pattern usingBlock:^(NSInteger captureCount, NSString *const __unsafe_unretained *capturedStrings, const NSRange *capturedRanges, volatile BOOL *const stop) {
        if ((*capturedRanges).length == 0) return;
        
        XWTextPart *part = [[XWTextPart alloc] init];
        part.text = *capturedStrings;
        part.range = *capturedRanges;
        [parts addObject:part];
    }];
    
    // 排序
    // 按照从小 -> 大的顺序排列对象
    [parts sortUsingComparator:^NSComparisonResult(XWTextPart *part1, XWTextPart *part2) {
        // NSOrderedAscending = -1L, NSOrderedSame, NSOrderedDescending
        // 返回NSOrderedSame:两个一样大
        // NSOrderedAscending(升序):part2>part1
        // NSOrderedDescending(降序):part1>part2
        if (part1.range.location > part2.range.location) {
            // part1>part2
            // part1放后面, part2放前面
            return NSOrderedDescending;
        }
        // part1<part2
        // part1放前面, part2放后面
        return NSOrderedAscending;
    }];

    UIFont *font = [UIFont systemFontOfSize:15];
    // 按顺序拼接每一段文字
    for (XWTextPart *part in parts) {
        // 等会需要拼接的子串
        NSAttributedString *substr = nil;
       
        if (part.special) { // 非表情的特殊文字
            substr = [[NSAttributedString alloc] initWithString:part.text attributes:@{
                                                                                       NSForegroundColorAttributeName : [UIColor redColor]
                                                                                       }];
        } else { // 非特殊文字
            substr = [[NSAttributedString alloc] initWithString:part.text];
        }
        [attributedText appendAttributedString:substr];
    }
    
    // 一定要设置字体,保证计算出来的尺寸是正确的
    [attributedText addAttribute:NSFontAttributeName value:font range:NSMakeRange(0, attributedText.length)];
    
    return attributedText;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.normalTextView resignFirstResponder];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
