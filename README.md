# ydict_bat
A command line youdao dictionary tool under windows.

# install
Download the yd.bat file and set system path variable for it.

# usage
yd \<word\>

The \<word\> parameter could be in English or Chinese.
if in English, the output will be:

- Pronouciations in English and American English. (<font color='#32CD32'><b>Green</font> Colored)
- Interpretations. (<font color='orange'><b>Orange</font>  colored)
- Example sentences. (<font color='purple'><b>Purple</font>  colored)

# prerequisite

- jq : for urlencoding
- curl : for fetching html content from website
- pup : css selector
- sed : for removing \n
  all the tools above could be easily install with scoop/choco, e.g. scoop install jq
