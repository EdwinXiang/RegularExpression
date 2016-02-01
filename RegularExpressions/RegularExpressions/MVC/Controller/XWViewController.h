//
//  XWPhoneViewController.h
//  RegularExpressions
//
//  Created by Edwin on 16/2/1.
//  Copyright © 2016年 EdwinXiang. All rights reserved.
//@"PhoneVc",@"emailVc",@"userPsswordVc",@"IDCardVc",@"allNumberVc",@"urlVc",@"EnglishAlphabetVc"

#import <UIKit/UIKit.h>

typedef enum {
    RegularExpressionTypePhone,
    RegularExpressionTypeEmail,
    RegularExpressionTypeUrl,
    RegularExpressionTypeAllNumber,
    RegularExpressionTypeIDCardVc,
    RegularExpressionTypeEnglishAlphabetVc,
    RegularExpressionTypeuserPsswordVc,
    RegularExpressionTypeIPAddress,
    RegularExpressionTypeChinese,
}RegularExpressionType;
@interface XWViewController : UIViewController

@property (nonatomic,assign)RegularExpressionType type;
@end
