//
//  TCSSettingsCells.m
//  vinylogue
//
//  Created by Christopher Trott on 2/21/13.
//  Copyright (c) 2013 TwoCentStudios. All rights reserved.
//

#import "TCSSettingsCells.h"

@implementation TCSSettingsCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
  self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
  if (self) {
    self.selectionStyle = UITableViewCellSelectionStyleGray;
    
    self.backgroundView = [[UIView alloc] init];
    self.selectedBackgroundView = [[UIView alloc] init];
    self.backgroundView.backgroundColor = WHITE_SUBTLE;
    self.selectedBackgroundView.backgroundColor = BLUE_DARK;
    
    self.textLabel.font = [[self class] font];
    self.textLabel.textColor = BLUE_DARK;
    self.textLabel.highlightedTextColor = WHITE_SUBTLE;
    self.indentationLevel = 1;
    
  }
  return self;
}

- (void)prepareForReuse {
  [super prepareForReuse];
  
  self.textLabel.text = nil;
}

// Inelegantly fixes an iOS7 bug where the cell's background is above the
// delete button in the view hierarchy
-(void)didTransitionToState:(UITableViewCellStateMask)state {
  if (state & UITableViewCellStateShowingDeleteConfirmationMask ) {
    [self sendSubviewToBack:self.backgroundView];
  }
  
  [super didTransitionToState:state];
}

# pragma mark - TCSimpleCell

+ (UIFont *)font{
  return FONT_AVN_REGULAR(24);
}

- (void)setTitleText:(NSString *)text{
  self.textLabel.text = text;
}

@end


@implementation TCSBigSettingsCell

+ (UIFont *)font{
  return FONT_AVN_REGULAR(34);
}

@end

@implementation TCSSettingsHeaderCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
  self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
  if (self) {
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    self.backgroundView = [[UIView alloc] init];
    self.backgroundView.backgroundColor = WHITE_SUBTLE;
    
    self.textLabel.font = [[self class] font];
    self.textLabel.textColor = BLUE_DARK;
    self.textLabel.backgroundColor = CLEAR;
    self.indentationLevel = 1;
    
    
  }
  return self;
}

- (void)prepareForReuse {
  [super prepareForReuse];
  
  self.textLabel.text = nil;
}

- (void)layoutSubviews{
  [super layoutSubviews];
  
  [self.textLabel sizeToFit];
  self.textLabel.bottom = CGRectGetMaxY(self.contentView.bounds);

}

# pragma mark - TCSimpleCell

+ (UIFont *)font{
  return FONT_AVN_ULTRALIGHT(17);
}

- (void)setTitleText:(NSString *)text{
  self.textLabel.text = text;
}


@end

@implementation TCSSettingsFooterCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
  self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
  if (self) {
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    self.backgroundView = [[UIView alloc] init];
    self.backgroundView.backgroundColor = WHITE_SUBTLE;
    
    self.textLabel.font = [[self class] font];
    self.textLabel.textColor = BLUE_DARK;
    self.textLabel.backgroundColor = CLEAR;
    self.textLabel.textAlignment = NSTextAlignmentCenter;
    self.textLabel.numberOfLines = 0;
    
  }
  return self;
}

- (void)prepareForReuse {
  [super prepareForReuse];
  
  self.textLabel.text = nil;
}

- (void)layoutSubviews{
  [super layoutSubviews];
  
  [self.textLabel sizeToFit];
  self.textLabel.top = CGRectGetMinY(self.contentView.bounds);
  
}

# pragma mark - TCSimpleCell

+ (UIFont *)font{
  return FONT_AVN_ULTRALIGHT(14);
}

- (void)setTitleText:(NSString *)text{
  self.textLabel.text = text;
}

@end