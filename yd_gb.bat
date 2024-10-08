@set tempword=%1
@echo %tempword%|iconv -t utf-8>yd.tmp.0
@rem 使用iconv将输入转为utf-8编码
@jq -rRs --args @uri < yd.tmp.0 > yd.tmp.1
@rem 使用jq进行urlencode
@sed "s/%%0A//g"<yd.tmp.1>yd.tmp.2
@rem 去掉末尾因为echo产生的换行符，也就是%0A
@set /p tempword=<yd.tmp.2
@curl -k -G -s "https://dict.youdao.com/result?word=%tempword%&lang=en" > yd.html
@rem 去网易有道词典查询单词
@echo [96m
@rem 亮青色
@echo %1
@echo [32m
@rem 绿色  
@pup -p ".per-phone text{}" < yd.html | sed --locale=zh_CN.utf8 -z "s/\n//g"
@rem 找到音标部分，使用sed去掉换行符（sed -z使用\0而不是\n作为输入分隔符）
@echo.
@echo [33m  
@rem 橙色
@sed --locale=zh_CN.utf8 "s/\(<\s*\/[Bb]\s*>\)\|\(<\s*[Bb]\s*>\)//g" yd.html | pup -p ".simple.dict-module .word-exp text{}"
@rem 使用sed去掉释义部分的<b>和</b>，以免在所查询单词处换行
@echo.  
@echo [35m  
@rem 紫色
@sed --locale=zh_CN.utf8 "s/\(<\s*\/[Bb]\s*>\)\|\(<\s*[Bb]\s*>\)//g" yd.html | pup -p ".blng_sents_part .word-exp text{}"
@rem 例句，同样去掉黑体tag，以免被pup处理后换行
@rem del yd.tmp
@del yd.tmp.0 yd.tmp.1 yd.tmp.2
@echo [0m 
@rem 恢复白色