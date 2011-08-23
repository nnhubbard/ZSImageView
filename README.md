ZSImageView
=============

This is a replacement for UIImageView. Unlike UIImageView, ZSImageView supports loading a remote image
as well as providing a default image while the remote image is loading.  You can also round any of the
edges individually and set the cornerRadius.

How It Works
---

Create a ZSImageView and set the remote and default image:

```objective-c
ZSImageView *imageView = [[[ZSImageView alloc] initWithFrame:CGRectMake(0, 0, 200.0f, 200.0f)] autorelease];
imageView.imageUrl = @"http://www.indiaonrent.com/forwards/b/beautiful-mountains/res/593qen.jpg";
imageView.defaultImage = [UIImage imageNamed:@"no-image.png"];
imageView.contentMode = UIViewContentModeScaleAspectFill;
[self.view addSubview:imageView];
```

If you want to round three of the edges and give the view a cornerRadius of 10 it is pretty easy:

```objective-c
ZSImageView *imageView = [[[ZSImageView alloc] initWithFrame:CGRectMake(0, 0, 200.0f, 200.0f)] autorelease];
imageView2.imageUrl = @"http://www.desktopwallpaperhd.com/wallpapers/3/4501.jpg";
imageView2.defaultImage = [UIImage imageNamed:@"no-image.png"];
imageView.corners = ZSRoundCornerTopLeft | ZSRoundCornerBottomLeft | ZSRoundCornerTopRight;
imageView2.cornerRadius = 10;
[self.view addSubview:imageView];
```

Options to Round Edges
---
There are five options you can use to round the edges of your `ZSImageView`. `ZSRoundCornerTopLeft`, `ZSRoundCornerTopRight`, `ZSRoundCornerBottomLeft`, `ZSRoundCornerBottomRight`, `ZSRoundCornerAll`. These can be combined to round a few edges or you can use `ZSRoundCornerAll` to round all of the edges.

How to use in your App
---
`ZSImageView` requires the `QuartzCore.framework`. Once you have that added you need to copy `ZSImageView.h` and 
`ZSImageView.m` as well as `JMImageCache.h` and `JMImageCache.m` to your project. Then `#import` the `ZSImageView.h`
header file where you need it and start using it.

Notes
---

ZSImageView uses [JMImageCache](https://github.com/jakemarsh/JMImageCache) to load and cache the remote image.
