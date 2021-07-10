//
//  ComposeViewController.m
//  Instagram
//
//  Created by tomisin on 7/8/21.
//

#import "ComposeViewController.h"
#import "Post.h"

@interface ComposeViewController () <UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UITextView *textCaption;
@property (strong, nonatomic) UIImage *image;
@property (strong, nonatomic) UIImagePickerController *imagePicker;

@end

@implementation ComposeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.imagePicker = [UIImagePickerController new];
    self.imagePicker.delegate = self;
    self.imagePicker.allowsEditing = YES;
    
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        self.imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    }
    else {
        NSLog(@"Camera 🚫 available so we will use photo library instead");
        self.imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }

    [self presentViewController:self.imagePicker animated:YES completion:nil];
    
    [[self.textCaption layer] setBorderColor:[[UIColor grayColor] CGColor]];
    [[self.textCaption layer] setBorderWidth:3];
    [[self.textCaption layer] setCornerRadius:15];
}

- (IBAction)didTapCancel:(id)sender {
    NSLog(@"Tapped Cancel");
    [self dismissViewControllerAnimated:YES completion:nil];
    [self.tabBarController setSelectedIndex:0];
}

- (IBAction)didTapPost:(id)sender {
    NSLog(@"Tapped Post");
    [Post postUserImage:self.image withCaption:self.textCaption.text withCompletion:^(BOOL succeeded, NSError * _Nullable error) {
            if (succeeded) {
                [self dismissViewControllerAnimated:YES completion:nil];
                [self.tabBarController setSelectedIndex:0];
            }
            else{
                NSLog(@"Error creating post: %@", error.localizedDescription);
            }
    }];
}

- (IBAction)didTapPicture:(id)sender {
    [self presentViewController:self.imagePicker animated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<UIImagePickerControllerInfoKey,id> *)info {
    
    CGSize imageSize = CGSizeMake(250, 250);
    UIImage *editedImage = info[UIImagePickerControllerEditedImage];
    UIImage *resizedImage = [self resizeImage:editedImage withSize:imageSize];
    
    self.image = resizedImage;
    self.imageView.image = self.image;
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

- (UIImage *)resizeImage:(UIImage *)image withSize:(CGSize) size {
    UIImageView *resizedImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, size.width, size.height)];
    
    resizedImageView.contentMode = UIViewContentModeScaleAspectFill;
    resizedImageView.image = image;
    
    UIGraphicsBeginImageContext(size);
    [resizedImageView.layer  renderInContext:UIGraphicsGetCurrentContext()];
    
    UIImage *resultImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return resultImage;
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
