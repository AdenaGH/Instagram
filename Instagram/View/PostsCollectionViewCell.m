//
//  PostsCollectionViewCell.m
//  Instagram
//
//  Created by Adena Rowana Ninvalle on 7/9/21.
//

#import "PostsCollectionViewCell.h"

@implementation PostsCollectionViewCell

-(void)setPost:(Post *)post {
   
    [post.image getDataInBackgroundWithBlock:^(NSData * _Nullable data, NSError * _Nullable error) {
        if (!error) {
            self.postImage.image = [UIImage imageWithData:data];
        }
    }];
}
@end
