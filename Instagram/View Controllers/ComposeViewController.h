//
//  ComposeViewController.h
//  Instagram
//
//  Created by tomisin on 7/8/21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol ComposeViewControllerDelegate

- (IBAction)didTapCancel:(id)sender;
- (IBAction)didTapPost:(id)sender;
- (IBAction)didTapPicture:(id)sender;
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<UIImagePickerControllerInfoKey,id> *)info;

@end

@interface ComposeViewController : UIViewController

@property (weak, nonatomic) id<ComposeViewControllerDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
