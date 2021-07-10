//
//  ProfileViewController.m
//  Instagram
//
//  Created by Adena Rowana Ninvalle on 7/9/21.
//

#import "ProfileViewController.h"
#import "PostsCollectionViewCell.h"
#import "Parse/Parse.h"


@interface ProfileViewController ()<UICollectionViewDelegate, UICollectionViewDataSource>
@property (strong, nonatomic) NSMutableArray *posts;

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic, strong) UIRefreshControl *refreshControl;


@end

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
    [self fetchPosts];
    
    PFUser *currentUser = PFUser.currentUser;
    [currentUser fetchInBackgroundWithBlock:^(PFObject * _Nullable object, NSError * _Nullable error) {
    }];
    
    self.refreshControl = [[UIRefreshControl alloc] init];
    [self.refreshControl addTarget:self action:@selector(fetchPosts) forControlEvents:UIControlEventValueChanged];
    [self.collectionView insertSubview:self.refreshControl atIndex:0];

}

- (void)fetchPosts {
    // construct query
    PFQuery *query = [PFQuery queryWithClassName:@"Post"];
    [query orderByDescending:@"createdAt"];
    [query includeKey:@"author"];
    [query whereKey:@"author" equalTo:[PFUser currentUser]];
    // fetch data asynchronously
    [query findObjectsInBackgroundWithBlock:^(NSArray *posts, NSError *error) {
        if (posts != nil) {
            // do something with the array of object returned by the call
            self.posts = (NSMutableArray *) posts;
            NSLog(@"Posts assigned to array");
            
            NSInteger numOfPost = self.posts.count;
            
            PFUser *currentUser = PFUser.currentUser;
            [currentUser fetchInBackgroundWithBlock:^(PFObject * _Nullable object, NSError * _Nullable error) {

                PFFileObject *image = currentUser[@"profile_image"];
                NSURL *url = [NSURL URLWithString:image.url];
                
            }];
            [self.collectionView reloadData];
            
        } else {
            NSLog(@"%@", error.localizedDescription);
            
        }
        [self.refreshControl endRefreshing];
    }];
}

- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    PostsCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"PostsCollectionViewCell" forIndexPath:indexPath];
    cell.post = self.posts[indexPath.item];
    
    return cell;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.posts.count;
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
