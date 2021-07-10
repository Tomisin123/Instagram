//
//  PostCell.m
//  Instagram
//
//  Created by tomisin on 7/8/21.
//

#import "PostCell.h"

@implementation PostCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setPost:(Post *)post {
    _post = post;
    
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
    
    self.caption.text = self.post[@"caption"];
    self.likes.text = [NSString stringWithFormat:@"%@ Likes", self.post[@"likeCount"]];
    
}

@end
