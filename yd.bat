@set tempword=%1
@echo %tempword%|iconv -t utf-8>yd.tmp.0
@rem ʹ��iconv������תΪutf-8����
@jq -rRs --args @uri < yd.tmp.0 > yd.tmp.1
@rem ʹ��jq����urlencode
@sed "s/%%0A//g"<yd.tmp.1>yd.tmp.2
@rem ȥ��ĩβ��Ϊecho�����Ļ��з���Ҳ����%0A
@set /p tempword=<yd.tmp.2
@curl -k -G -s "https://dict.youdao.com/result?word=%tempword%&lang=en" > yd.html
@rem ȥ�����е��ʵ��ѯ����
@echo [96m
@rem ����ɫ
@echo %1
@echo [32m
@rem ��ɫ  
@pup -p ".per-phone text{}" < yd.html | sed --locale=zh_CN.utf8 -z "s/\n//g"
@rem �ҵ����겿�֣�ʹ��sedȥ�����з���sed -zʹ��\0������\n��Ϊ����ָ�����
@echo.
@echo [33m  
@rem ��ɫ
@sed --locale=zh_CN.utf8 "s/\(<\s*\/[Bb]\s*>\)\|\(<\s*[Bb]\s*>\)//g" yd.html | pup -p ".simple.dict-module .word-exp text{}"
@rem ʹ��sedȥ�����岿�ֵ�<b>��</b>������������ѯ���ʴ�����
@echo.  
@echo [35m  
@rem ��ɫ
@sed --locale=zh_CN.utf8 "s/\(<\s*\/[Bb]\s*>\)\|\(<\s*[Bb]\s*>\)//g" yd.html | pup -p ".blng_sents_part .word-exp text{}"
@rem ���䣬ͬ��ȥ������tag�����ⱻpup�������
@rem del yd.tmp
@del yd.tmp.0 yd.tmp.1 yd.tmp.2
@echo [0m 
@rem �ָ���ɫ