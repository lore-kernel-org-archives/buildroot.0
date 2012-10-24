From: Vellemans, Noel <Noel.Vellemans@visionBMS.com>
Date: Wed, 24 Oct 2012 14:52:55 +0200
Subject: [Buildroot] Trying to BUMP libglib2 to a version >= 2.33.1
Message-ID: <1531E53627F1F749B4FE809BF2A4EB67039E83EE@WETMEX10.loepfe.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 
Hi all,
 
Trying to BUMP libglib2 to a version >= 2.33.1 .. 
 
I've ran into a strange situation where I do not yet the clue.
 
When ever I try to build the new libglib2 version 2.33.1 ..  it fails
... with  the following error's):

 
/imx537/du8pe_NVL/host/usr/bin/../lib/gcc/arm-unknown-linux-uclibcgnueab
i/4.5.3/../../../../arm-unknown-linux-uclibcgnueabi/bin/ld: warning:
libgthread-2.0.so.0, needed by ../gobject/.libs/libgobject-2.0.so, not
found (try using -rpath or -rpath-link)
/imx537/du8pe_NVL/host/usr/bin/../lib/gcc/arm-unknown-linux-uclibcgnueab
i/4.5.3/../../../../arm-unknown-linux-uclibcgnueabi/bin/ld: warning:
libgmodule-2.0.so.0, needed by ./.libs/libgio-2.0.so, not found (try
using -rpath or -rpath-link)
./.libs/libgio-2.0.so: undefined reference to `g_module_close'
./.libs/libgio-2.0.so: undefined reference to `g_module_symbol'
./.libs/libgio-2.0.so: undefined reference to `g_module_supported'

 
 
BUT, when I did compile the old-version of libglib2 before, then, if I
build the libglib2-2.33.1 (afterwards) everything is building..... 
 
In short it comes up to this: when building the 'old' version of
libglib2 before libglib2-2.33.1 everything builds, if not building the
old version of ligblib2 before building libglib2-2.33.1 it fails.


Any clue where to look at ?
 
 
Regards,
Noel
