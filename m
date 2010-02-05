From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri,  5 Feb 2010 09:53:35 +0000 (UTC)
Subject: [Buildroot] [Bug 1039] Not compiled on ubuntu karmic
In-Reply-To: <bug-1039-163@https.bugs.busybox.net/>
References: <bug-1039-163@https.bugs.busybox.net/>
Message-ID: <20100205095335.324C3776C2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1039





--- Comment #3 from Eduard Bondarenko <edbond@gmail.com>  2010-02-05 09:53:34 UTC ---
Thanks for quick reply, looks like git version is better.

However I got another bug:
/home/eduard/buildroot/output/staging/usr/bin/arm-linux-uclibcgnueabi-gcc -Os
-pipe -Os  -I/home/eduard/buildroot/output/staging/usr/include
-I/home/eduard/buildroot/output/staging/include
--sysroot=/home/eduard/buildroot/output/staging/ -isysroot
/home/eduard/buildroot/output/staging -mabi=aapcs-linux -msoft-float
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -I. -Os -pipe
-Os  -I/home/eduard/buildroot/output/staging/usr/include
-I/home/eduard/buildroot/output/staging/include
--sysroot=/home/eduard/buildroot/output/staging/ -isysroot
/home/eduard/buildroot/output/staging -mabi=aapcs-linux -msoft-float
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-L/home/eduard/buildroot/output/staging/lib
-L/home/eduard/buildroot/output/staging/usr/lib
--sysroot=/home/eduard/buildroot/output/staging/ -o at at.o panic.o perm.o
posixtm.o y.tab.o lex.yy.o  
lex.yy.o: In function `yylex':
lex.yy.c:(.text+0x157c): undefined reference to `yywrap'
collect2: ld returned 1 exit status
make[1]: *** [at] Error 1

flex is marked


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
