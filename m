From: =?ISO-8859-2?Q?Veljko_Milisavljevi=E6?= <mveljko78@gmail.com>
Date: Wed, 21 May 2008 11:09:32 +0200
Subject: [Buildroot] cygwin
Message-ID: <231d6fd00805210209l77f59b17tdd220326ea8ab158@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I have a problem with buildroot under Cygwin

Veljko Milisavljevic at ABS-CS2 /home/Veljko/buildroot-9260/buildroot-9260
$ make
make CC="/usr/bin/gcc" -C package/config conf mconf
make[1]: Entering directory
`/home/Veljko/buildroot-9260/buildroot-9260/package/config'
/usr/bin/gcc -I/usr/include/ncurses -DCURSES_LOC="<ncurses.h>" -DLOCALE -g
-O2   conf.o  zconf.tab.o -o conf
conf.o: In function `check_stdin':
/home/Veljko/buildroot-9260/buildroot-9260/package/config/conf.c:60:
undefined reference to `_gettext'
/home/Veljko/buildroot-9260/buildroot-9260/package/config/conf.c:61:
undefined reference to `_gettext'
/home/Veljko/buildroot-9260/buildroot-9260/package/config/conf.c:62:
undefined reference to `_gettext'
conf.o: In function `check_conf':
/home/Veljko/buildroot-9260/buildroot-9260/package/config/conf.c:483:
undefined reference to `_gettext'
conf.o: In function `main':
/home/Veljko/buildroot-9260/buildroot-9260/package/config/conf.c:622:
undefined reference to `_gettext'
conf.o:/home/Veljko/buildroot-9260/buildroot-9260/package/config/conf.c:541:
more undefined references to `_gettext' follow
collect2: ld returned 1 exit status
make[1]: *** [conf] Error 1
make[1]: Leaving directory
`/home/Veljko/buildroot-9260/buildroot-9260/package/config'
make: *** [package/config/mconf] Error 2
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080521/f12a2f1f/attachment.htm 
