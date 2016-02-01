# RegularExpression
使用正则表达式判断输入字符串是否正确；例如一些常用的电话号码判断，密码复杂度判断，URL地址判断，邮箱地址判断，IP地址判断等等；
##使用方法
1、下载本工程，工程里面包含demo和相应的库文件
XWRegularExpression.h
XWRegularExpression.m
2、将上面两个文件导入到你的工程项目中
在你需要检测的地方调用头文件里面的类方法
```/**
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

```
在你需要实现的地方调用相应的方法就可以了，eg:检测电话号码是否正确
``` 
if ([XWRegularExpression isPhoneNumber:inputText]) {
                self.resultLabel.text = @"输入的是电话号码";
            }else{
                self.resultLabel.text = @"输入的电话号码格式错误";
            }

```
##效果
![image](http://b343.photo.store.qq.com/psb?/2932833f-be8b-4313-8b40-99918076f4a8/iPbEfAOxgCT3IzsZgfTJ*Jg8LQx.Q7mXHk9yiLt6JDc!/b/dFcBAAAAAAAA&amp;bo=PAFLAjwBSwICCCw!)
*==如果有什么问题你可以通过邮件联系我：xiangwei_zd@163.com==*

