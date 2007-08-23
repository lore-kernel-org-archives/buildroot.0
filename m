From: Emil =?ISO-8859-1?Q?Kr=FCper?= <e.krueper@solcon-systemtechnik.de>
Date: Thu, 23 Aug 2007 13:04:02 +0200
Subject: [Buildroot] libdaemon-0.10.patch.bz2
Message-ID: <1187867042.9489.8.camel@PC-EK.Solcon>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Okay, I got another error when compiling libdaemon. I got the error
posted below. So I had a look
into /package/libdaemon/libdaemon-0.10.patch.bz2, as far as I can tell
something apparently went wrong there. 
Please confirm.

Best regards,

Emil Kr?per.

flex installed:                                 Ok
gettext installed:                              Ok
makeinfo installed:                             Ok
Build system dependencies:                      Ok

/usr/bin/make -j2
DESTDIR=/home/buildroot/buildroot-20070821/build_i586/staging_dir
-C /home/buildroot/buildroot-20070821/build_i586/libdaemon-0.10 install
make[1]: Entering directory
`/home/buildroot/buildroot-20070821/build_i586/libdaemon-0.10'
Making install in libdaemon
make[2]: Entering directory
`/home/buildroot/buildroot-20070821/build_i586/libdaemon-0.10/libdaemon'
make[3]: Entering directory
`/home/buildroot/buildroot-20070821/build_i586/libdaemon-0.10/libdaemon'
test -z "/lib" || mkdir -p --
"/home/buildroot/buildroot-20070821/build_i586/staging_dir/lib"
test -z "/include/libdaemon" || mkdir -p --
"/home/buildroot/buildroot-20070821/build_i586/staging_dir/include/libdaemon"
 /home/ulf/projects/Buildroot/20070820/buildroot-avr32/build_avr32_wchar/libdaemon-0.10/libtool --mode=install /usr/bin/install -c  'libdaemon.la' '/home/buildroot/buildroot-20070821/build_i586/staging_dir/lib/libdaemon.la'
/bin/sh: line
4: /home/ulf/projects/Buildroot/20070820/buildroot-avr32/build_avr32_wchar/libdaemon-0.10/libtool: No such file or directory
make[3]: *** [install-libLTLIBRARIES] Error 127
make[3]: *** Waiting for unfinished jobs....
 /usr/bin/install -c -m 644 'dlog.h'

*cutting here*

PC-EK:/home/buildroot/buildroot-20070821# 
