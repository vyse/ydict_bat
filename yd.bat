@set tempword=%1
@echo %tempword%|iconv -t utf-8>yd.tmp.0
@jq -rRs --args @uri < yd.tmp.0 > yd.tmp.1
@sed "s/%%0A//g"<yd.tmp.1>yd.tmp.2
@set /p tempword=<yd.tmp.2
@curl -k -G -s "https://dict.youdao.com/result?word=%tempword%&lang=en" > yd.html
@echo [96m
@echo %1
@echo [32m
@pup -p ".per-phone text{}" < yd.html | sed --locale=zh_CN.utf8 -z "s/\n//g"
@echo.
@echo [33m  
@sed --locale=zh_CN.utf8 "s/\(<\s*\/[Bb]\s*>\)\|\(<\s*[Bb]\s*>\)//g" yd.html | pup -p ".simple.dict-module .word-exp text{}"
@echo.  
@echo [35m  
@sed --locale=zh_CN.utf8 "s/\(<\s*\/[Bb]\s*>\)\|\(<\s*[Bb]\s*>\)//g" yd.html | pup -p ".blng_sents_part .word-exp text{}"
@rem del yd.tmp
@del yd.tmp.0 yd.tmp.1 yd.tmp.2
@echo [0m 