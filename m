From: Kay McCormick <kaym@modsystems.com>
Date: Mon, 17 Sep 2007 16:55:12 -0700
Subject: [Buildroot] unable to build fontconfig
Message-ID: <2D30722FBBDE6749973243F4F01BE984C6568F@dotexchange.dotcorporation.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I can't disable fontconfig, but it won't build either!

 

autoreconf2.50: Entering directory `.'

autoreconf2.50: configure.in: not using Gettext

autoreconf2.50: running: aclocal -I
/home/kaym/src2/buildroot/build_i386/staging_dir/usr/share/aclocal
--force

aclocal:configure.in:64: warning: macro `AM_PROG_LIBTOOL' not found in
library

autoreconf2.50: configure.in: tracing

autoreconf2.50: configure.in: not using Libtool

autoreconf2.50: running: /usr/bin/autoconf
--include=/home/kaym/src2/buildroot/build_i386/staging_dir/usr/share/acl
ocal --force

configure.in:63: error: possibly undefined macro: AC_LIBTOOL_WIN32_DLL

      If this token and others are legitimate, please use
m4_pattern_allow.

      See the Autoconf documentation.

configure.in:64: error: possibly undefined macro: AM_PROG_LIBTOOL

autoreconf2.50: /usr/bin/autoconf failed with exit status: 1

make: ***
[/home/kaym/src2/buildroot/build_i386/fontconfig-2.4.2/.configured]
Error 1

 

Help!

 

Kay

-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20070917/888c102b/attachment-0001.htm 
