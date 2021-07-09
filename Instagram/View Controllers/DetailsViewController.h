//
//  DetailsViewController.h
//  Instagram
//
//  Created by Adena Rowana Ninvalle on 7/9/21.
//

#import <UIKit/UIKit.h>
#import "Post.h"
#import "Parse/Parse.h"

NS_ASSUME_NONNULL_BEGIN

@interface DetailsViewController : UIViewController
@property (nonatomic, strong) Post *post;

@end

NS_ASSUME_NONNULL_END
