//
//  HeaderView.m
//  FoldCell
//
//  Created by Watson on 2018/2/23.
//  Copyright © 2018年 Watson. All rights reserved.
//

#import "HeaderView.h"

@implementation HeaderView
- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        _tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(selectTap:)];
        [self.contentView addGestureRecognizer:_tap];
    }
    return self;
}

- (UITapGestureRecognizer *)tap{
    if (!_tap) {
        _tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(selectTap:)];
        [self addGestureRecognizer:_tap];
    }
    return _tap;
}

- (UILabel *)textLb{
    if (!_textLb) {
        _textLb = [UILabel new];
        _textLb.font = [UIFont systemFontOfSize:16];
        _textLb.frame = CGRectMake(0, 0, 100, 60);
        _textLb.backgroundColor = [UIColor yellowColor];
        [self addSubview:_textLb];
    }
    return _textLb;
}

- (void)selectTap:sender{
    !_tapBlock ?: _tapBlock(_section);
}
@end
