//
//  TTViewController.m
//  TTTagView
//
//  Created by icofans on 06/23/2020.
//  Copyright (c) 2020 icofans. All rights reserved.
//

#import "TTViewController.h"
#import "TTTagView.h"
#import <Masonry/Masonry.h>
#import "TTTableViewController.h"

@interface TTViewController ()

@property(nonatomic, strong) UIButton *addTag;
@property(nonatomic, strong) UIButton *removeTag;
@property(nonatomic, strong) UIButton *nextBtn;

@property(nonatomic, strong) UILabel *title1Label;
@property(nonatomic, strong) TTTagView *tagView1;
@property(nonatomic, strong) UILabel *title2Label;
@property(nonatomic, strong) TTTagView *tagView2;
@property(nonatomic, strong) UILabel *title3Label;
@property(nonatomic, strong) TTTagView *tagView3;


@end

@implementation TTViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.addTag = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.addTag setTitle:@"添加" forState:UIControlStateNormal];
    [self.addTag addTarget:self action:@selector(addTag:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.addTag];
    
    self.removeTag = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.removeTag setTitle:@"删除" forState:UIControlStateNormal];
    [self.removeTag addTarget:self action:@selector(removeTag:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.removeTag];
    
    
    self.nextBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.nextBtn setTitle:@"跳转" forState:UIControlStateNormal];
    [self.nextBtn addTarget:self action:@selector(next:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.nextBtn];
    
    self.title1Label = [[UILabel alloc] init];
    self.title1Label.text = @"不分页单选";
    [self.view addSubview:self.title1Label];
    
    self.title2Label = [[UILabel alloc] init];
    self.title2Label.text = @"分页多选";
    [self.view addSubview:self.title2Label];
    
    self.title3Label = [[UILabel alloc] init];
    self.title3Label.text = @"单行不可选";
    [self.view addSubview:self.title3Label];
    
    
    self.tagView1 = [[TTTagView alloc] init];
    self.tagView1.backgroundColor = [[UIColor orangeColor] colorWithAlphaComponent:0.3];
    [self.view addSubview:self.tagView1];
    
    self.tagView2 = [[TTTagView alloc] init];
    self.tagView2.numberOfLines = 3;
    self.tagView2.allowsMultipleSelection = YES;
    self.tagView2.backgroundColor = [[UIColor orangeColor] colorWithAlphaComponent:0.3];
    [self.view addSubview:self.tagView2];
    
    self.tagView3 = [[TTTagView alloc] init];
    self.tagView3.numberOfLines = 1;
    self.tagView3.allowsSelection = NO;
    self.tagView3.selected = YES;
    self.tagView3.backgroundColor = [[UIColor orangeColor] colorWithAlphaComponent:0.3];
    [self.view addSubview:self.tagView3];
    
    [self.addTag mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(60);
        make.left.mas_equalTo(40);
    }];
    
    [self.nextBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(60);
        make.centerX.mas_equalTo(self.view);
    }];
    [self.removeTag mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(60);
        make.right.mas_equalTo(-40);
    }];
    
    [self.title1Label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.addTag.mas_bottom).offset(16);
        make.left.mas_equalTo(16);
    }];
    [self.tagView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.title1Label.mas_bottom).offset(16);
        make.left.right.mas_equalTo(0);
    }];
    [self.title2Label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.tagView1.mas_bottom).offset(16);
        make.left.mas_equalTo(16);
    }];
    [self.tagView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.title2Label.mas_bottom).offset(16);
        make.left.right.mas_equalTo(0);
    }];
    
    [self.title3Label mas_makeConstraints:^(MASConstraintMaker *make) {
         make.top.mas_equalTo(self.tagView2.mas_bottom).offset(16);
         make.left.mas_equalTo(16);
     }];
     [self.tagView3 mas_makeConstraints:^(MASConstraintMaker *make) {
         make.top.mas_equalTo(self.title3Label.mas_bottom).offset(16);
         make.left.mas_equalTo(0);
         make.right.mas_equalTo(0);
     }];
    
    self.tagView1.tagsArray = @[@"林俊杰",@"张学友",@"刘德华",@"陶喆",@"王力宏",@"王菲",@"Taylor swift",@"周杰伦",@"owl city",@"汪苏泷",@"许嵩",@"李代沫",@"那英",@"羽泉",@"刀郎",@"田馥甄",@"庄心妍",@"林宥嘉",@"薛之谦",@"萧敬腾",@"王若琳"];
    
    self.tagView1.defaultSelectTags = @[@"羽泉"];
    
    
    
    self.tagView2.tagsArray = @[@"林俊杰",@"张学友",@"刘德华",@"陶喆",@"王力宏",@"王菲",@"Taylor swift",@"周杰伦",@"owl city",@"汪苏泷",@"许嵩",@"李代沫",@"那英",@"羽泉",@"刀郎",@"田馥甄",@"庄心妍",@"林宥嘉",@"薛之谦",@"王若琳",@"浩",@"凌风",@"绝尘",@"文昭",@"阳城",@"文",@"奇"];
    self.tagView2.defaultSelectTags = @[@"Taylor swift",@"田馥甄"];
    
    self.tagView3.tagsArray = @[@"林俊杰",@"张学友",@"刘德华",@"陶喆",@"王力宏",@"王菲",@"Taylor swift",@"周杰伦",@"owl city",@"汪苏泷",@"许嵩",@"李代沫",@"那英",@"羽泉",@"刀郎",@"田馥甄",@"庄心妍",@"林宥嘉",@"薛之谦",@"萧敬腾",@"王若琳"];
    
}


- (void)addTag:(UIButton *)sender
{
    NSArray *name_array = @[@"沈",@"秦",@"云",@"唐",@"高",@"裴",@"萧",@"上官",@"慕容",@"司徒",@"南宫",@"百里",@"北宫",@"月",@"楚",@"言",@"琴",@"古",@"镜",@"龙",@"冷",@"叶",@"北冥",@"公孙",@"独孤",@"皇甫",@"尚",@"闻人",@"苍羽",@"轩辕",@"南风",@"即墨"];
    NSArray *secondname_array = @[@"浩",@"凌风",@"绝尘",@"文昭",@"阳城",@"文",@"奇",@"华晨",@"鹤城",@"袁也",@"成飞",@"哲七",@"鸿远",@"正",@"心池",@"池",@"心",@"阅",@"光",@"水",@"翰",@"和",@"清",@"易",@"宣",@"德",@"茂",@"明",@"纬",@"寺",@"明",@"晖",@"飞语",@"文哲",@"真",@"嘉",@"一",@"",@"寒",@"亦凌",@"宇",@"莫离",@"陵",@"宇轩",@"晨浩",@"痕",@"渊",@"尚城",@"离",@"陌",@"渡",@"陌然"];
       int name_value = arc4random()%name_array.count;
       int secondname_value = arc4random()%secondname_array.count;
       
       NSString *name_str = name_array[name_value];
       NSString *secondname_str = secondname_array[secondname_value];
       
       NSString *name = [[NSString alloc]initWithFormat:@"%@%@",name_str,secondname_str];
    [self.tagView1 addTag:name];
    [self.tagView2 addTag:name];
    [self.tagView3 addTag:name];
    
    NSLog(@"%@",self.tagView1.tagsArray);
}

- (void)removeTag:(UIButton *)sender
{
    int r1 = arc4random() % [self.tagView1.tagsArray count];
    int r2 = arc4random() % [self.tagView2.tagsArray count];
    int r3 = arc4random() % [self.tagView3.tagsArray count];
    
    [self.tagView1 removeTag:[self.tagView1.tagsArray objectAtIndex:r1]];
    [self.tagView2 removeTag:[self.tagView2.tagsArray objectAtIndex:r2]];
    [self.tagView3 removeTag:[self.tagView3.tagsArray objectAtIndex:r3]];
}

- (void)next:(UIButton *)sender
{
    TTTableViewController *tb = [[TTTableViewController alloc] init];
    [self presentViewController:tb animated:YES completion:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
