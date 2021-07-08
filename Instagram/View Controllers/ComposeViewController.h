//
//  ComposeViewController.h
//  Instagram
//
//  Created by Adena Rowana Ninvalle on 7/7/21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ComposeViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property (weak, nonatomic) IBOutlet UITextView *captionTextView;
@property (weak, nonatomic) IBOutlet UIImageView *selectedImage;
@property (weak, nonatomic) IBOutlet UIButton *selectImage;
@property (weak, nonatomic) UIImagePickerController *imageController;
@end

NS_ASSUME_NONNULL_END
