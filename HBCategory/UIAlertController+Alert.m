#import "UIAlertController+Alert.h"


@implementation UIAlertController (Alert)

+ (UIAlertController *)hb_alertControllerWithTitle:(NSString *)title
                                           message:(NSString *)message
                                       optionStyle:(OptionStyle)optionStyle
                                           OkTitle:(NSString *)okTitle
                                       cancelTitle:(NSString *)cancelTitle
                                      OkTitleColor:(UIColor *)okColor
                                  cancelTitleColor:(UIColor *)cancelColor
                                           okBlock:(dispatch_block_t)okBlock
                                       cancelBlock:(dispatch_block_t)cancelBlock{
    
    UIAlertController* alert=[UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    if (optionStyle == OptionStyleStyleOnlyOK) {
        UIAlertAction* OK=[UIAlertAction actionWithTitle:okTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            if (okBlock) {
                okBlock();
            }
        }];
        [OK setValue:okColor forKey:@"titleTextColor"];
        [alert addAction:OK];
    } else {
        UIAlertAction* cancel=[UIAlertAction actionWithTitle:cancelTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            if (cancelBlock) {
                cancelBlock();
            }
        }];
        UIAlertAction* OK=[UIAlertAction actionWithTitle:okTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            if (okBlock) {
                okBlock();
            }
        }];
        [OK setValue:okColor forKey:@"titleTextColor"];
        [cancel setValue:cancelColor forKey:@"titleTextColor"];
        [alert addAction:cancel];
        [alert addAction:OK];
    }
    return alert;
}


+ (UIAlertController *)hb_sheetAlertControllerWithTitle:(NSString *)title message:(NSString *)message optionStyle:(OptionStyle)optionStyle OkTitle:(NSString *)okTitle cancelTitle:(NSString *)cancelTitle okBlock:(dispatch_block_t)okBlock cancelBlock:(dispatch_block_t)cancelBlock {
    
    UIAlertController* alert=[UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleActionSheet];
    if (optionStyle == OptionStyleStyleOnlyOK) {
        UIAlertAction* OK=[UIAlertAction actionWithTitle:okTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            if (okBlock) {
                okBlock();
            }
        }];
        [alert addAction:OK];
    } else {
        UIAlertAction* cancel=[UIAlertAction actionWithTitle:cancelTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            if (cancelBlock) {
                cancelBlock();
            }
        }];
        UIAlertAction* OK=[UIAlertAction actionWithTitle:okTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            if (okBlock) {
                okBlock();
            }
        }];
        [alert addAction:cancel];
        [alert addAction:OK];
        
    }
    return alert;
}

+ (UIAlertController *)hb_sheetAlertControllerWithTitle:(NSString *)title message:(NSString *)message cancelTitle:(NSString *)cancelTitle titleArray:(NSArray *)titleArray okBlock:(void (^)(NSInteger idx))okBlock cancelBlock:(dispatch_block_t)cancelBlock {
    
    __block UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction* cancel = [UIAlertAction actionWithTitle:cancelTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        if (cancelBlock) {
            cancelBlock();
        }
    }];
    [alert addAction:cancel];
    
    [titleArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSString *title = (NSString *)obj;
        UIAlertAction *OK = [UIAlertAction actionWithTitle:title style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            if (okBlock) {
                okBlock(idx);
            }
        }];
        [alert addAction:OK];
    }];

    return alert;
}


//带一个输入框的alert
+ (UIAlertController *)hb_alertControllerWithTitle:(NSString *)title
                                           message:(NSString *)message
                                       optionStyle:(OptionStyle)optionStyle
                                           OkTitle:(NSString *)okTitle
                                       cancelTitle:(NSString *)cancelTitle
                                      OkTitleColor:(UIColor *)okColor
                                  cancelTitleColor:(UIColor *)cancelColor
                                           okBlock:(dispatch_block_t)okBlock
                                       cancelBlock:(dispatch_block_t)cancelBlock
                                       placeholder:(NSString *)placeholder
                                   secureTextEntry:(BOOL)secureTextEntry

{
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    if (optionStyle == OptionStyleStyleOnlyOK) {
        UIAlertAction* OK = [UIAlertAction actionWithTitle:okTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            if (okBlock) {
                okBlock();
            }
        }];
        [OK setValue:okColor forKey:@"titleTextColor"];
        [alert addAction:OK];
    } else {
        UIAlertAction* cancel = [UIAlertAction actionWithTitle:cancelTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            if (cancelBlock) {
                cancelBlock();
            }
        }];
        UIAlertAction* OK = [UIAlertAction actionWithTitle:okTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            if (okBlock) {
                okBlock();
            }
        }];
        [OK setValue:okColor forKey:@"titleTextColor"];
        [cancel setValue:cancelColor forKey:@"titleTextColor"];
        [alert addAction:cancel];
        [alert addAction:OK];
        //定义第一个输入框；
        [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
            textField.placeholder = placeholder;
            textField.secureTextEntry = secureTextEntry;
            
        }];
    }
    return alert;
    
}
+ (UIAlertController *)hb_alertControllerWithTitle:(NSString *)title
                                           message:(NSString *)message
                                       optionStyle:(OptionStyle)optionStyle
                                           OkTitle:(NSString *)okTitle
                                       cancelTitle:(NSString *)cancelTitle
                                      OkTitleColor:(UIColor *)okColor
                                  cancelTitleColor:(UIColor *)cancelColor
                                           okBlock:(dispatch_block_t)okBlock
                                       cancelBlock:(dispatch_block_t)cancelBlock
                                    firstTextField:(UITextField *)firstTextField
                                   secondTextField:(UITextField *)secondTextField{
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    if (optionStyle == OptionStyleStyleOnlyOK) {
        UIAlertAction* OK = [UIAlertAction actionWithTitle:okTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            if (okBlock) {
                okBlock();
            }
        }];
        [OK setValue:okColor forKey:@"titleTextColor"];
        [alert addAction:OK];
    } else {
        UIAlertAction* cancel = [UIAlertAction actionWithTitle:cancelTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            if (cancelBlock) {
                cancelBlock();
            }
        }];
        UIAlertAction* OK = [UIAlertAction actionWithTitle:okTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            if (okBlock) {
                okBlock();
            }
        }];
        [OK setValue:okColor forKey:@"titleTextColor"];
        [cancel setValue:cancelColor forKey:@"titleTextColor"];
        [alert addAction:cancel];
        [alert addAction:OK];
        //定义第一个输入框；
        [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
            textField.placeholder = firstTextField.placeholder;
            textField.secureTextEntry = firstTextField.secureTextEntry;
            textField.text = firstTextField.text;
        }];
        //定义第二个输入框；
        [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
            textField.placeholder = secondTextField.placeholder;
            textField.secureTextEntry = secondTextField.secureTextEntry;
            textField.text = secondTextField.text;
        }];
    }
    return alert;
}
@end
