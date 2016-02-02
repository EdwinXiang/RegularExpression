//
//  XWRegularExpression.h
//  RegularExpressions
//
//  Created by Edwin on 16/2/1.
//  Copyright © 2016年 EdwinXiang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XWRegularExpression : NSObject
/**
 *  是否为电话号码
 *
 *  @param pattern 传入需要检测的字符串
 *
 *  @return 返回检测结果 是或者不是
 */
+(BOOL)isPhoneNumber:(NSString *)patternStr;
/**
 *  检测是否为邮箱
 *
 *  @param pattern 传入需要检测的字符串
 *
 *  @return 返回检测结果 是或者不是
 */
+(BOOL)detectionIsEmailQualified:(NSString *)patternStr;
/**
 *  检测用户输入密码是否以字母开头，长度在6-18之间，只能包含字符、数字和下划线。
 *
 *  @param pattern 传入需要检测的字符串
 *
 *  @return 返回检测结果 是或者不是
 */
+(BOOL)detectionIsPasswordQualified:(NSString *)patternStr;
/**
 *  验证身份证号（15位或18位数字）
 *  @param pattern 传入需要检测的字符串
 *
 *  @return 返回检测结果 是或者不是
 */
+(BOOL)detectionIsIdCardNumberQualified:(NSString *)patternStr;

/**
 *  验证IP地址（15位或18位数字）
 *  @param pattern 传入需要检测的字符串
 *
 *  @return 返回检测结果 是或者不是
 */
+(BOOL)detectionIsIPAddress:(NSString *)patternStr;

/**
 *  验证输入的是否全为数字
 *  @param pattern 传入需要检测的字符串
 *
 *  @return 返回检测结果 是或者不是
 */
+(BOOL)detectionIsAllNumber:(NSString *)patternStr;

/**
 *  验证由26个英文字母组成的字符串
 *  @param pattern 传入需要检测的字符串
 *
 *  @return 返回检测结果 是或者不是
 */
+(BOOL)detectionIsEnglishAlphabet:(NSString *)patternStr;
/**
 *  验证输入的是否是URL地址
 *  @param pattern 传入需要检测的字符串
 *
 *  @return 返回检测结果 是或者不是
 */
+(BOOL)detectionIsUrl:(NSString *)patternStr;

/**
 *  验证输入的是否是URL地址
 *  @param pattern 传入需要检测的字符串
 *
 *  @return 返回检测结果 是或者不是
 */
+(BOOL)detectionIsChinese:(NSString *)patternStr;

/**
 *  验证输入的是否是URL地址
 *  @param pattern 传入需要检测的字符串
 *
 *  @return 返回检测结果 是或者不是
 */
+(BOOL)detectionNormalText:(NSString *)normalStr WithHighLightText:(NSString *)HighLightStr;
@end
