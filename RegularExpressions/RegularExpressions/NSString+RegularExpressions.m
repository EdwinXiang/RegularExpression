//
//  NSString+RegularExpressions.m
//  RegularExpressions
//
//  Created by Edwin on 16/2/1.
//  Copyright © 2016年 EdwinXiang. All rights reserved.
//

#import "NSString+RegularExpressions.h"

@implementation NSString (RegularExpressions)

-(BOOL)match:(NSString *)pattern
{
    // 1.创建正则表达式
    NSRegularExpression *regex = [[NSRegularExpression alloc] initWithPattern:pattern options:0 error:nil];
    // 2.测试字符串
    NSArray *results = [regex matchesInString:self options:0 range:NSMakeRange(0, self.length)];
    
    return results.count > 0;
}
-(BOOL)isPhoneNumber:(NSString *)pattern{
    
    return [self match:@"^1[34578]\\d{9}$"];
}

-(BOOL)detectionIsEmailQualified:(NSString *)pattern{
    
    return [self match:@"^\\w+[-+.]\\w+)*@\\w+([-.]\\w+)*\\w+([-.]\\w+)*$"];
}

-(BOOL)detectionIsIdCardNumberQualified:(NSString *)pattern{
    
    return [self match:@"^\\d{15}|\\d{}18$"];
}

-(BOOL)detectionIsPasswordQualified:(NSString *)pattern{
    
    return [self match:@"^[a-zA-Z]\\w{5,17}$"];
}

- (BOOL)isIPAddress
{
    // 1-3个数字: 0-255
    // 1-3个数字.1-3个数字.1-3个数字.1-3个数字
    return [self match:@"((2[0-4]\\d|25[0-5]|[01]?\\d\\d?)\\.){3}(2[0-4]\\d|25[0-5]|[01]?\\d\\d?)"];
}

-(BOOL)detectionIsAllNumber:(NSString *)pattern{
    
    return [self match:@"^[0-9]*$"];
}

-(BOOL)detectionIsEnglishAlphabet:(NSString *)pattern{
    
    return [self match:@"^[A-Za-z]+$"];
}

-(BOOL)detectionIsUrl:(NSString *)pattern{
    
    return [self match:@"\\b(([\\w-]+://?|www[.])[^\\s()<>]+(?:\\([\\w\\d]+\\)|([^[:punct:]\\s]|/)))"];
}

@end
