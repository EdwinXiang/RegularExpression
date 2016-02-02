//
//  XWRegularExpression.m
//  RegularExpressions
//
//  Created by Edwin on 16/2/1.
//  Copyright © 2016年 EdwinXiang. All rights reserved.
//

#import "XWRegularExpression.h"

@implementation XWRegularExpression

+(BOOL)isPhoneNumber:(NSString *)patternStr{
    
    NSString *pattern = @"^1[34578]\\d{9}$";
    NSRegularExpression *regex = [[NSRegularExpression alloc] initWithPattern:pattern options:0 error:nil];
    NSArray *results = [regex matchesInString:patternStr options:0 range:NSMakeRange(0, patternStr.length)];
    return results.count > 0;
}

+(BOOL)detectionIsEmailQualified:(NSString *)patternStr{
    
    NSString *pattern = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSRegularExpression *regex = [[NSRegularExpression alloc] initWithPattern:pattern options:0 error:nil];
    NSArray *results = [regex matchesInString:patternStr options:0 range:NSMakeRange(0, patternStr.length)];
    return results.count > 0;
}

+(BOOL)detectionIsIdCardNumberQualified:(NSString *)patternStr{
    NSString *pattern = @"^\\d{15}|\\d{18}$";
    NSRegularExpression *regex = [[NSRegularExpression alloc] initWithPattern:pattern options:0 error:nil];
    NSArray *results = [regex matchesInString:patternStr options:0 range:NSMakeRange(0, patternStr.length)];
    return results.count > 0;
}

+(BOOL)detectionIsPasswordQualified:(NSString *)patternStr{
    NSString *pattern = @"^[a-zA-Z]\\w.{5,17}$";
    NSRegularExpression *regex = [[NSRegularExpression alloc] initWithPattern:pattern options:0 error:nil];
    NSArray *results = [regex matchesInString:patternStr options:0 range:NSMakeRange(0, patternStr.length)];
    return results.count > 0;
}

+ (BOOL)detectionIsIPAddress:(NSString *)patternStr
{

    NSString *pattern = @"((2[0-4]\\d|25[0-5]|[01]?\\d\\d?)\\.){3}(2[0-4]\\d|25[0-5]|[01]?\\d\\d?)";
    NSRegularExpression *regex = [[NSRegularExpression alloc] initWithPattern:pattern options:0 error:nil];
    NSArray *results = [regex matchesInString:patternStr options:0 range:NSMakeRange(0, patternStr.length)];
    return results.count > 0;
}

+(BOOL)detectionIsAllNumber:(NSString *)patternStr{
    NSString *pattern = @"^[0-9]*$";
    NSRegularExpression *regex = [[NSRegularExpression alloc] initWithPattern:pattern options:0 error:nil];
    NSArray *results = [regex matchesInString:patternStr options:0 range:NSMakeRange(0, patternStr.length)];
    return results.count > 0;
}

+(BOOL)detectionIsEnglishAlphabet:(NSString *)patternStr{
    NSString *pattern = @"^[A-Za-z]+$";
    NSRegularExpression *regex = [[NSRegularExpression alloc] initWithPattern:pattern options:0 error:nil];
    NSArray *results = [regex matchesInString:patternStr options:0 range:NSMakeRange(0, patternStr.length)];
    return results.count > 0;
}

+(BOOL)detectionIsUrl:(NSString *)patternStr{
    NSString *pattern = @"\\b(([\\w-]+://?|www[.])[^\\s()<>]+(?:\\([\\w\\d]+\\)|([^[:punct:]\\s]|/)))";
    NSRegularExpression *regex = [[NSRegularExpression alloc] initWithPattern:pattern options:0 error:nil];
    NSArray *results = [regex matchesInString:patternStr options:0 range:NSMakeRange(0, patternStr.length)];
    return results.count > 0;
}
+(BOOL)detectionIsChinese:(NSString *)patternStr{
    NSString *pattern = @"[\u4e00-\u9fa5]+";
    NSRegularExpression *regex = [[NSRegularExpression alloc] initWithPattern:pattern options:0 error:nil];
    NSArray *results = [regex matchesInString:patternStr options:0 range:NSMakeRange(0, patternStr.length)];
    return results.count > 0;
}

+(BOOL)detectionNormalText:(NSString *)normalStr WithHighLightText:(NSString *)HighLightStr{
    
    NSString *pattern = [NSString stringWithFormat:@"%@",HighLightStr];
    NSRegularExpression *regex = [[NSRegularExpression alloc] initWithPattern:pattern options:0 error:nil];
    NSArray *results = [regex matchesInString:normalStr options:0 range:NSMakeRange(0, normalStr.length)];
    for (NSTextCheckingResult *resltText in results) {
        NSLog(@"----------------%zd",resltText.range.length);
    }
    return results.count > 0;
}
@end
