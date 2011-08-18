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
imageView.imageUrl = @"http://www.desktopwallpaperhd.com/wallpapers/3/4501.jpg";
imageView.defaultImage = [UIImage imageNamed:@"no-image.png"];
[self.view addSubview:imageView];
```

If you want to round two of the edges and give the view a cornerRadius of 10 it is pretty easy:

```objective-c
ZSImageView *imageView = [[[ZSImageView alloc] initWithFrame:CGRectMake(0, 0, 200.0f, 200.0f)] autorelease];
imageView.imageUrl = @"http://www.desktopwallpaperhd.com/wallpapers/3/4501.jpg";
imageView.defaultImage = [UIImage imageNamed:@"no-image.png"];
imageView.topLeft = YES;
imageView.bottomLeft = YES;
imageView.cornerRadius = 10;
[self.view addSubview:imageView];
```

Notes
---

ZSImageView uses [JMImageCache](https://github.com/jakemarsh/JMImageCache) to load and cache the remote image.