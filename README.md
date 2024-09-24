# ydict_bat
A command line youdao dictionary tool under windows.

# install
Download the yd.bat file and set system path variable for it.

# usage
yd \<word\>

The \<word\> parameter could be in English or Chinese.
if in English, the output will be:

- <b>Pronouciations</b> in English and American English. ($${\color{green}Green}$$ Colored)
- <b>Interpretations</b>. ($${\color{orange}Orange}$$  colored)
- <b>Example sentences</b>. ($${\color{purple}Purple}$$  colored)

# prerequisite

- jq : for urlencoding
- curl : for fetching html content from website
- pup : css selector
- sed : for removing \n
all the tools above could be easily install with scoop/choco, e.g. scoop install jq
