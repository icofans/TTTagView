# TTTagView

[![CI Status](https://img.shields.io/travis/icofans/TTTagView.svg?style=flat)](https://travis-ci.org/icofans/TTTagView)
[![Version](https://img.shields.io/cocoapods/v/TTTagView.svg?style=flat)](https://cocoapods.org/pods/TTTagView)
[![License](https://img.shields.io/cocoapods/l/TTTagView.svg?style=flat)](https://cocoapods.org/pods/TTTagView)
[![Platform](https://img.shields.io/cocoapods/p/TTTagView.svg?style=flat)](https://cocoapods.org/pods/TTTagView)

## 简介

一个优雅的支持单行，多行分页，支持单选多选等功能的自定义标签视图

1、支持自动布局，不需要计算高度，也不需要指定frame，自适应高度

2、支持单行，多行显示

3、支持分页显示

4、支持单选，多选，禁用选择

5、支持添加和删除Tag

6、支持字典数据类型


## 使用

1、使用cocopods

```ruby
pod 'TTTagView'
```
2、创建TagView

```ruby
// 创建
self.tagView = [[TTTagView alloc] init];
[self.view addSubview:self.tagView];

// 布局
[self.tagView mas_makeConstraints:^(MASConstraintMaker *make) {
    make.top.mas_equalTo(16);
    make.left.right.mas_equalTo(0);
}];

// 赋值
// 指定数据
self.tagView.tagsArray = @[@"林俊杰",@"张学友",@"刘德华",@"陶喆",@"王力宏",@"王菲",@"Taylor swift",@"周杰伦",@"owl city",@"汪苏泷",@"许嵩",@"李代沫",@"那英",@"羽泉",@"刀郎",@"田馥甄",@"庄心妍",@"林宥嘉",@"薛之谦",@"萧敬腾",@"王若琳"];
// 指定默认选中的数据（可选）
self.tagView.defaultSelectTags = @[@"羽泉"];

// 获取选中的数据
NSArray *selectTags = self.tagView.selectTags;
```
## 截图

<img src="https://qn.nobady.cn/icofans/1651592882396_.pic.jpg" width="320">
