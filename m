From: Claas Hilbrecht <claas+maillinglists.buildroot@jucs-kramkiste.de>
Date: Thu, 03 Apr 2008 15:12:53 +0200
Subject: [Buildroot] mpfr build fails cause of problem with libgmp
Message-ID: <5939E3E26D5ED7D414E6A6F4@[192.168.83.145]>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I just trying to build svn rev 21626 with a simple "make" and the build 
will stop at mpfr with this error:

buildroot/svn-tree/build_i486/gmp-4.2.2/.libs/libgmp.so: undefined 
reference to `__strtol_internal'
buildroot/svn-tree/build_i486/gmp-4.2.2/.libs/libgmp.so: undefined 
reference to `_IO_getc'
buildroot/svn-tree/build_i486/gmp-4.2.2/.libs/libgmp.so: undefined 
reference to `_IO_putc'

It seems that libgmp is build with some wrong dependecies.

-- 
 Claas Hilbrecht
 http://www.jucs-kramkiste.de
