//
//  PostCell.m
//  Instagram
//
//  Created by Adena Rowana Ninvalle on 7/8/21.
//

#import "PostCell.h"
#import "Post.h"
#import "Parse/Parse.h"
#import "DateTools/DateTools.h"

@implementation PostCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setPost:(Post *)post {
    _post = post;
    self.postCaption.text = post.caption;
   
    [post.image getDataInBackgroundWithBlock:^(NSData * _Nullable data, NSError * _Nullable error) {
        if (!error) {
            self.postImage.image = [UIImage imageWithData:data];
        }
    }];
    self.postUser.text =[@"@" stringByAppendingString:post.author.username];;
    
    NSString *dateString = [NSString stringWithFormat:@"%@", post.createdAt];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    // Configure the input format to parse the date string
    formatter.dateFormat = @"YYYY-MM-dd HH:mm:ss z";
    // Convert String to Date
    NSDate *postDate = [formatter dateFromString:dateString];
    
    formatter.dateStyle = NSDateFormatterShortStyle;
    self.postDate.text = postDate.shortTimeAgoSinceNow;
    
    
}

@end
