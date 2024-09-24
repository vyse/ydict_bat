@set tempword=%1
@echo %tempword%|iconv -t utf-8>yd.tmp.0
@rem Ê¹ÓÃiconv½«ÊäÈë×ªÎªutf-8±àÂë
@jq -rRs --args @uri < yd.tmp.0 > yd.tmp.1
@rem Ê¹ÓÃjq½øĞĞurlencode
@sed "s/%%0A//g"<yd.tmp.1>yd.tmp.2
@rem È¥µôÄ©Î²ÒòÎªecho²úÉúµÄ»»ĞĞ·û£¬Ò²¾ÍÊÇ%0A
@set /p tempword=<yd.tmp.2
@curl -k -G -s "https://dict.youdao.com/result?word=%tempword%&lang=en" > yd.html
@rem È¥ÍøÒ×ÓĞµÀ´Êµä²éÑ¯µ¥´Ê
@echo [96m
@rem ÁÁÇàÉ«
@echo %1
@echo [32m
@rem ÂÌÉ«  
@pup -p ".per-phone text{}" < yd.html | sed --locale=zh_CN.utf8 -z "s/\n//g"
@rem ÕÒµ½Òô±ê²¿·Ö£¬Ê¹ÓÃsedÈ¥µô»»ĞĞ·û£¨sed -zÊ¹ÓÃ\0¶ø²»ÊÇ\n×÷ÎªÊäÈë·Ö¸ô·û£©
@echo.
@echo [33m  
@rem ³ÈÉ«
@sed --locale=zh_CN.utf8 "s/\(<\s*\/[Bb]\s*>\)\|\(<\s*[Bb]\s*>\)//g" yd.html | pup -p ".simple.dict-module .word-exp text{}"
@rem Ê¹ÓÃsedÈ¥µôÊÍÒå²¿·ÖµÄ<b>ºÍ</b>£¬ÒÔÃâÔÚËù²éÑ¯µ¥´Ê´¦»»ĞĞ
@echo.  
@echo [35m  
@rem ×ÏÉ«
@sed --locale=zh_CN.utf8 "s/\(<\s*\/[Bb]\s*>\)\|\(<\s*[Bb]\s*>\)//g" yd.html | pup -p ".blng_sents_part .word-exp text{}"
@rem Àı¾ä£¬Í¬ÑùÈ¥µôºÚÌåtag£¬ÒÔÃâ±»pup´¦Àíºó»»ĞĞ
@rem del yd.tmp
@del yd.tmp.0 yd.tmp.1 yd.tmp.2
@echo [0m 
@rem »Ö¸´°×É«