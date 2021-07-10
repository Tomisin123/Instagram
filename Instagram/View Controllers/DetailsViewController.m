//
//  DetailsViewController.m
//  Instagram
//
//  Created by tomisin on 7/9/21.
//

#import "DetailsViewController.h"

@interface DetailsViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *postImageView;
@property (weak, nonatomic) IBOutlet UILabel *username;
@property (weak, nonatomic) IBOutlet UILabel *numLikes;
@property (weak, nonatomic) IBOutlet UILabel *caption;
@property (weak, nonatomic) IBOutlet UILabel *timestamp;

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    PFUser *user = self.post[@"author"];
    [user fetchInBackgroundWithBlock:^(PFObject * _Nullable object, NSError * _Nullable error) {
        if (error == nil){
            self.username.text = object[@"username"];
        }
        else {
            NSLog(@"Error fetching user: %@", error.localizedDescription);
        }
    }];
    
    PFFileObject *image = self.post[@"image"];
    [image getDataInBackgroundWithBlock:^(NSData * _Nullable data, NSError * _Nullable error) {
        if (error == nil){
            self.postImageView.image = [UIImage imageWithData:data];
        }
        else{
            NSLog(@"Error fetching image: %@", error.localizedDescription);
        }
    }];
    
    NSDate *createdAt = [self.post createdAt];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateStyle = NSDateFormatterShortStyle;
    formatter.timeStyle = NSDateFormatterShortStyle;
    
    self.timestamp.text = [formatter stringFromDate:createdAt];
    
    self.caption.text = self.post[@"caption"];
    self.numLikes.text = [NSString stringWithFormat:@"%@ Likes", self.post[@"likeCount"]];
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
