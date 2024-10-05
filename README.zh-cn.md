
# ydict_bat
访问有道词典的命令行工具.

# 安装
下载 yd.bat ，设置path环境变量即可使用.

# 用法
`yd <word>`

参数 \<word\> 可以是中文或英文单词.
如果输入的是英文单词，输出是:

- <b>音标</b> 包括英式和美式. ($${\color{green}绿色}$$)
- <b>释义</b>. ($${\color{orange}橙色}$$)
- <b>例句</b>. ($${\color{purple}紫色}$$)  

*例子*:

```
D:\github\ydict_bat\>yd anthology

anthology

英/ ænˈθɒlədʒi /美/ ænˈθɑːlədʒi /

n.
（诗、文、曲、画等的）选集


It's a longish poem, not in your anthology, but you can find it in The Complete Yeats.
这是一首很长的诗，你们的选集里没有，但在《叶芝诗选》里可以找到。
You have just one of them in your anthology, but it is one of the greatest. It is on page 130.
你们选集里只有一首，但是它是最好的之一。它在130页。
Having said that, there's really nothing so dead as The Norton Anthology of English Literature, or ponderous.
说了这么多，其实没有什么比《诺顿英国文学选集》更死板，或者更沉闷的了。
```

# 前置要求
1. 软件要求
- jq : 用来进行urlencoding
- curl : 从网站获取html内容
- pup : css选择器
- sed : 用来删除大量的换行符<br />

  上述工具都可以使用scoop/choco安装, 如：`scoop install jq`

2. 当前目录需要可写, 因为ydict_bat会创建临时文件.
