//
//  PostCell.h
//  Instagram
//
//  Created by Adena Rowana Ninvalle on 7/8/21.
//

#import <UIKit/UIKit.h>
#import "Post.h"
NS_ASSUME_NONNULL_BEGIN

@interface PostCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *postImage;
@property (weak, nonatomic) IBOutlet UILabel *postCaption;
@property (weak, nonatomic) IBOutlet UILabel *postDate;
@property (weak, nonatomic) IBOutlet UILabel *postUser;
@property (strong, nonatomic) Post *post;
-(void)setPost:(Post *)post;
@end

NS_ASSUME_NONNULL_END
