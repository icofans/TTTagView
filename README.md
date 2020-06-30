
前因
Xcode升级后，发现跑旧项目调试遇到自定义View部分会卡死，找到原因是在layoutSubviews给self.frame赋值，导致循环调用。

其实在我们的项目中，难免会用到自动布局，简单的使用frame就可以搞定，但是复杂的控件，如果外面用的自动布局，自定义控件使用frame就很复杂。

一般我们都会在View内部算好大小，通知外部去更新布局，这种方案是可以实现，但是复杂了点。我们希望自定义的View像UILabel那样，autolayout时方便快捷。

在了解如何让自定义View支持自动布局,我们需要了解intrinsicContentSize这个属性，也就是控件的内置大小。比如UILabel，UIButton等控件，他们都有自己的内置大小。控件的内置大小往往是由控件本身的内容所决定的，比如一个UILabel的文字很长，那么该UILabel的内置大小自然会很长。控件的内置大小可以通过UIView的intrinsicContentSize属性来获取内置大小，也可以通过invalidateIntrinsicContentSize方法来在下次UI规划事件中重新计算intrinsicContentSize。如果直接创建一个原始的UIView对象，显然它的内置大小为0。

那么我们就可以使用这个属性来让我们的View支持自动布局，只需要简单的几步

1、重写intrinsicContentSize返回内部大小

2、在大小变化的时候调用 invalidateIntrinsicContentSize 通知内部大小变化。

后果
于是就有了下面这个自定义的tagView

![](https://upload-images.jianshu.io/upload_images/3132653-6fc3ebd05e5fbb57.jpg?imageMogr2/auto-orient/strip|imageView2/2/w/1080/format/webp?imageMogr2/auto-orient/strip%7CimageView2/2/w/320)

1、支持自动布局，不需要计算高度，也不需要指定frame，自适应高度

2、支持单行，多行显示

3、支持分页显示

4、支持单选，多选，禁用选择

5、支持添加和删除Tag

6、支持字典数据类型


使用也比较简单

```
// 创建
self.tagView = [[TTTagView alloc] init];
[self.view addSubview:self.tagView];

// 布局
[self.tagView mas_makeConstraints:^(MASConstraintMaker *make) {
    make.top.mas_equalTo(16);
    make.left.right.mas_equalTo(0);
}];

// 指定数据
self.tagView.tagsArray = @[@"林俊杰",@"张学友",@"刘德华",@"陶喆",@"王力宏",@"王菲",@"Taylor swift",@"周杰伦",@"owl city",@"汪苏泷",@"许嵩",@"李代沫",@"那英",@"羽泉",@"刀郎",@"田馥甄",@"庄心妍",@"林宥嘉",@"薛之谦",@"萧敬腾",@"王若琳"];

// 指定默认选中的数据（可选）
self.tagView.defaultSelectTags = @[@"羽泉"];

// 获取选中的数据
NSArray *selectTags = self.tagView.selectTags;
```

具体Demo见 https://github.com/icofans/TTTagView

