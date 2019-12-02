
# Makefile/Makefile.am/Makefile.in三者关系
https://blog.csdn.net/fzy0201/article/details/17427761

                           autoconf  -> configure
configure.in ---------> 
              aclocal -> aclocal.m4

              automake
Makefile.am  ----------> Makefile.in

             configure
Makefile.in ----------> Makefile

              autoscan
目录中的源文件 -------------> configure.scan
                修改&改名
configure.scan --------------> configure.in



