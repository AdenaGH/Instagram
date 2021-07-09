//
//  DetailsViewController.m
//  Instagram
//
//  Created by Adena Rowana Ninvalle on 7/9/21.
//

#import "DetailsViewController.h"
#import "Parse/Parse.h"
#import "DateTools/DateTools.h"

@interface DetailsViewController ()
@property (weak, nonatomic) IBOutlet UILabel *usernameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *postedImage;
@property (weak, nonatomic) IBOutlet UILabel *captionLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"%@", self.post);
    self.captionLabel.text = self.post.caption;
    self.usernameLabel.text = [@"@" stringByAppendingString:self.post.author.username];
    //self.timeLabel.text - self.post.
    [self.post.image getDataInBackgroundWithBlock:^(NSData * _Nullable data, NSError * _Nullable error) {
        if (!error) {
            self.postedImage.image = [UIImage imageWithData:data];
        }
    }];
    
    NSString *dateString = [NSString stringWithFormat:@"%@", self.post.createdAt];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    // Configure the input format to parse the date string
    formatter.dateFormat = @"YYYY-MM-dd HH:mm:ss z";
    // Convert String to Date
    NSDate *postDate = [formatter dateFromString:dateString];
    
    formatter.dateStyle = NSDateFormatterShortStyle;
    self.timeLabel.text = postDate.shortTimeAgoSinceNow;
    
    
    
    
    
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
