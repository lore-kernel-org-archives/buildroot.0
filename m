From: Vellemans, Noel <Noel.Vellemans@visionBMS.com>
Date: Thu, 8 Mar 2012 17:43:55 +0100
Subject: [Buildroot] X11 troubles "xlib_libXpm-3.5.8"
Message-ID: <1531E53627F1F749B4FE809BF2A4EB67030D48EC@WETMEX10.loepfe.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi All,

While trying to build the GIT-buildroot for and updated Webkit
("WebKit1.6.3"), I've ran into something I can NOT find, where it goes
wrong.

With the buildroot from 20120305, can build WebKit [ 1.2.27 and 1.6.3
(this is where I'm working on) ].

With the GIT version (20120307) I'm having troubles, with multiple
undefined references in "xlib_libXpm-3.5.8" for example `XtSetValues'.

I've  been digging into the files that are changed (20120307 compared to
20120305) but I don't see anything that is directly related to this
problem.

Any hints... Where to look at ? 


Noel.


PS: Build for ARM (imx537), X11, with Webkit .


>> xlib_libXpm 3.5.8 Building
PATH="/datadisk2/buildhome2/git/07032012/buildroot/output/host/bin:/data
disk2/buildhome2/git/07032012/buildroot/output/host/usr/bin:/datadisk2/b
uildhome2/git/07032012/buildroot/output/host/usr/sbin/:/usr/local/sbin:/
usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games"
PERLLIB="/datadisk2/buildhome2/git/07032012/buildroot/output/host/usr/li
b/perl"  /usr/bin/make -j7  -C
/datadisk2/buildhome2/git/07032012/buildroot/output/build/xlib_libXpm-3.
5.8/
make[1]: Entering directory
`/datadisk2/buildhome2/git/07032012/buildroot/output/build/xlib_libXpm-3
.5.8'
/usr/bin/make  all-recursive
make[2]: Entering directory
`/datadisk2/buildhome2/git/07032012/buildroot/output/build/xlib_libXpm-3
.5.8'
Making all in src
make[3]: Entering directory
`/datadisk2/buildhome2/git/07032012/buildroot/output/build/xlib_libXpm-3
.5.8/src'
make[3]: Nothing to be done for `all'.
make[3]: Leaving directory
`/datadisk2/buildhome2/git/07032012/buildroot/output/build/xlib_libXpm-3
.5.8/src'
Making all in sxpm
make[3]: Entering directory
`/datadisk2/buildhome2/git/07032012/buildroot/output/build/xlib_libXpm-3
.5.8/sxpm'
  CCLD   sxpm)(
/datadisk2/buildhome2/git/07032012/buildroot/output/host/usr/arm-unknown
-linux-uclibcgnueabi/sysroot/usr/lib/libICE.so: warning: gethostbyaddr
is obsolescent, use getaddrinfo() instead.
sxpm.o: In function `main':
/datadisk2/buildhome2/git/07032012/buildroot/output/build/xlib_libXpm-3.
5.8/sxpm/sxpm.c:171: undefined reference to `XtSetLanguageProc'
/datadisk2/buildhome2/git/07032012/buildroot/output/build/xlib_libXpm-3.
5.8/sxpm/sxpm.c:176: undefined reference to `XtInitialize'
/datadisk2/buildhome2/git/07032012/buildroot/output/build/xlib_libXpm-3.
5.8/sxpm/sxpm.c:191: undefined reference to `XtDatabase'
/datadisk2/buildhome2/git/07032012/buildroot/output/build/xlib_libXpm-3.
5.8/sxpm/sxpm.c:192: undefined reference to `XtDatabase'
/datadisk2/buildhome2/git/07032012/buildroot/output/build/xlib_libXpm-3.
5.8/sxpm/sxpm.c:223: undefined reference to `XtSetValues'
/datadisk2/buildhome2/git/07032012/buildroot/output/build/xlib_libXpm-3.
5.8/sxpm/sxpm.c:225: undefined reference to `XtDatabase'
/datadisk2/buildhome2/git/07032012/buildroot/output/build/xlib_libXpm-3.
5.8/sxpm/sxpm.c:226: undefined reference to `XtDatabase'
/datadisk2/buildhome2/git/07032012/buildroot/output/build/xlib_libXpm-3.
5.8/sxpm/sxpm.c:237: undefined reference to `XtDatabase'
/datadisk2/buildhome2/git/07032012/buildroot/output/build/xlib_libXpm-3.
5.8/sxpm/sxpm.c:238: undefined reference to `XtDatabase'
/datadisk2/buildhome2/git/07032012/buildroot/output/build/xlib_libXpm-3.
5.8/sxpm/sxpm.c:267: undefined reference to `XtSetValues'
/datadisk2/buildhome2/git/07032012/buildroot/output/build/xlib_libXpm-3.
5.8/sxpm/sxpm.c:383: undefined reference to `XtRealizeWidget'
/datadisk2/buildhome2/git/07032012/buildroot/output/build/xlib_libXpm-3.
5.8/sxpm/sxpm.c:529: undefined reference to `XtResizeWidget'
/datadisk2/buildhome2/git/07032012/buildroot/output/build/xlib_libXpm-3.
5.8/sxpm/sxpm.c:546: undefined reference to `XtMalloc'
/datadisk2/buildhome2/git/07032012/buildroot/output/build/xlib_libXpm-3.
5.8/sxpm/sxpm.c:558: undefined reference to `XtAddEventHandler'
/datadisk2/buildhome2/git/07032012/buildroot/output/build/xlib_libXpm-3.
5.8/sxpm/sxpm.c:569: undefined reference to `XtFree'
/datadisk2/buildhome2/git/07032012/buildroot/output/build/xlib_libXpm-3.
5.8/sxpm/sxpm.c:570: undefined reference to `XtMainLoop'
/datadisk2/buildhome2/git/07032012/buildroot/output/build/xlib_libXpm-3.
5.8/sxpm/sxpm.c:576: undefined reference to `XtStrings'
/datadisk2/buildhome2/git/07032012/buildroot/output/build/xlib_libXpm-3.
5.8/sxpm/sxpm.c:576: undefined reference to `XtStrings'
/datadisk2/buildhome2/git/07032012/buildroot/output/build/xlib_libXpm-3.
5.8/sxpm/sxpm.c:576: undefined reference to `XtStrings'
/datadisk2/buildhome2/git/07032012/buildroot/output/build/xlib_libXpm-3.
5.8/sxpm/sxpm.c:576: undefined reference to `XtShellStrings'
/datadisk2/buildhome2/git/07032012/buildroot/output/build/xlib_libXpm-3.
5.8/sxpm/sxpm.c:576: undefined reference to `XtStrings'
/datadisk2/buildhome2/git/07032012/buildroot/output/build/xlib_libXpm-3.
5.8/sxpm/sxpm.c:576: undefined reference to `XtShellStrings'
