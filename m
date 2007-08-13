From: Christopher Reder <creder@digitalcpt.com>
Date: Mon, 13 Aug 2007 08:39:03 -0500
Subject: [Buildroot] fontconfig fails using latest snapshot
Message-ID: <008101c7ddaf$503dc830$2600a8c0@engineering5>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

linuxbox:/home/christopher/sb/buildroot# make fontconfig


 <snip> 


 

make[3]: Entering directory
`/home/christopher/sb/buildroot/build_arm/fontconfig-2.4.2/fc-case'

/usr/bin/make  all-am

make[4]: Entering directory
`/home/christopher/sb/buildroot/build_arm/fontconfig-2.4.2/fc-case'

/usr/bin/gcc -DHAVE_CONFIG_H -I. -I.. -I../src -I.. -Wall -Wpointer-arith
-Wstrict-prototypes   -Wmissing-prototypes -Wmissing-declarations
-Wnested-externs -fno-strict-aliasing  -MT fc-case.o -MD -MP -MF
.deps/fc-case.Tpo -c -o fc-case.o fc-case.c

In file included from ../fontconfig/fcfreetype.h:27,

                 from ../src/fcint.h:50,

                 from fc-case.c:25:

/usr/include/ft2build.h:56:38: error: freetype/config/ftheader.h: No such
file or directory

In file included from ../src/fcint.h:50,

                 from fc-case.c:25:

../fontconfig/fcfreetype.h:28:10: error: #include expects "FILENAME" or
<FILENAME>

In file included from ../src/fcint.h:50,

                 from fc-case.c:25:

../fontconfig/fcfreetype.h:37: error: expected ?=?, ?,?, ?;?, ?asm? or
?__attribute__? before ?FcFreeTypeCharIndex?

../fontconfig/fcfreetype.h:40: error: expected ?)? before ?face?

../fontconfig/fcfreetype.h:43: error: expected ?)? before ?face?

../fontconfig/fcfreetype.h:46: error: expected declaration specifiers or
?...? before ?FT_Face?

../fontconfig/fcfreetype.h:49: warning: type defaults to ?int? in
declaration of ?FT_Face?

../fontconfig/fcfreetype.h:49: error: expected ?;?, ?,? or ?)? before ?f?

../fontconfig/fcfreetype.h:52: warning: type defaults to ?int? in
declaration of ?FT_Face?

../fontconfig/fcfreetype.h:52: error: expected ?;?, ?,? or ?)? before ?face?

In file included from fc-case.c:25:

../src/fcint.h:720: error: expected ?)? before ?encoding?

make[4]: *** [fc-case.o] Error 1

make[4]: Leaving directory
`/home/christopher/sb/buildroot/build_arm/fontconfig-2.4.2/fc-case'

make[3]: *** [all] Error 2

make[3]: Leaving directory
`/home/christopher/sb/buildroot/build_arm/fontconfig-2.4.2/fc-case'

make[2]: *** [all-recursive] Error 1

make[2]: Leaving directory
`/home/christopher/sb/buildroot/build_arm/fontconfig-2.4.2'

make[1]: *** [all] Error 2

make[1]: Leaving directory
`/home/christopher/sb/buildroot/build_arm/fontconfig-2.4.2'

make: ***
[/home/christopher/sb/buildroot/build_arm/fontconfig-2.4.2/.compiled] Error
2

linuxbox:/home/christopher/sb/buildroot#

-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20070813/d82c05a5/attachment.htm 
