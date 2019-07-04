//
//  SMTPAttachment.h
//  SinriMailTextPost
//
//  Created by Sinri Edogawa on 2019/7/3.
//  Copyright © 2019 Sinri Edogawa. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SMTPAttachment : NSObject
    
    @property(nonatomic,copy) NSString* name;
    @property(nonatomic,copy) NSString* filePath;

@end

NS_ASSUME_NONNULL_END
