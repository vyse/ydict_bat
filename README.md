# ydict_bat
A command line youdao dictionary tool under windows.

# install
Download the yd.bat file and set system path variable for it.

# usage
`yd \<word\>`

The \<word\> parameter could be in English or Chinese.
if in English, the output will be:

- <b>Pronouciations</b> in English and American English. ($${\color{green}Green}$$ Colored)
- <b>Interpretations</b>. ($${\color{orange}Orange}$$  colored)
- <b>Example sentences</b>. ($${\color{purple}Purple}$$  colored)  

*Example*:

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

# prerequisite
1. software dependencies
    - jq : for urlencoding
    - curl : for fetching html content from website
    - pup : css selector
    - sed : for removing \n<br />

        All above tools could be easily installed with scoop/choco, e.g. `scoop install jq`

2. When running yd.bat, the current path should be writable, because ydict_bat creates some temporary files when running.
