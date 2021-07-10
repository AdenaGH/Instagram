//
//  PostsCollectionViewCell.h
//  Instagram
//
//  Created by Adena Rowana Ninvalle on 7/9/21.
//

#import <UIKit/UIKit.h>
#import "Post.h"

NS_ASSUME_NONNULL_BEGIN

@interface PostsCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *postImage;
@property (nonatomic, strong) Post* post;

-(void)setPost:(Post *)post;

@end

NS_ASSUME_NONNULL_END
