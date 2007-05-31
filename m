From: Johnny Karlsson <Johnny.Karlsson@manodo.se>
Date: Thu, 31 May 2007 09:51:02 +0200
Subject: [Buildroot] Trouble building libglib2
Message-ID: <787E2E49F620DD44BB4F375B971805431CC27FEFA5@ex03.YODA.se>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi, i'm trying to build libglib2 with buildroot but when I run make I get this error:

checking for _FILE_OFFSET_BITS value needed for large files... 64
checking for _LARGE_FILES value needed for large files... no
checking for pkg-config... /buildroot/buildroot/build_arm/staging_dir/usr/bin/pkg-config
checking for gawk... (cached) mawk
checking for perl5... no
checking for perl... perl
checking for indent... no
checking for perl... /usr/bin/perl
checking for iconv_open... no
checking for libiconv_open in -liconv... no
checking for iconv_open in -liconv... no
configure: error: *** No iconv() implementation found in C library or libiconv
make: *** [/buildroot/buildroot/build_arm/glib-2.12.9/.configured] Error 1

How do I fix this? I'm running ubuntu 7.04 and the trunk version of buildroot.

Best Regards

Johnny Karlsson
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20070531/7ffb833e/attachment.htm 
