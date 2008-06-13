From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Fri, 13 Jun 2008 04:49:43 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc:  4.2.4
Message-ID: <20080613114943.756813C832@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-06-13 04:49:42 -0700 (Fri, 13 Jun 2008)
New Revision: 22318

Log:
toolchain: gcc 4.2.4 support



Added:
   trunk/buildroot/toolchain/gcc/4.2.4/
   trunk/buildroot/toolchain/gcc/4.2.4/100-uclibc-conf.patch
   trunk/buildroot/toolchain/gcc/4.2.4/103-uclibc-conf-noupstream.patch
   trunk/buildroot/toolchain/gcc/4.2.4/104-gnuhurd-uclibc-conf.patch
   trunk/buildroot/toolchain/gcc/4.2.4/200-uclibc-locale.patch
   trunk/buildroot/toolchain/gcc/4.2.4/203-uclibc-locale-no__x.patch
   trunk/buildroot/toolchain/gcc/4.2.4/204-uclibc-locale-wchar_fix.patch
   trunk/buildroot/toolchain/gcc/4.2.4/205-uclibc-locale-update.patch
   trunk/buildroot/toolchain/gcc/4.2.4/300-libstdc++-pic.patch
   trunk/buildroot/toolchain/gcc/4.2.4/301-missing-execinfo_h.patch
   trunk/buildroot/toolchain/gcc/4.2.4/302-c99-snprintf.patch
   trunk/buildroot/toolchain/gcc/4.2.4/303-c99-complex-ugly-hack.patch
   trunk/buildroot/toolchain/gcc/4.2.4/304-index_macro.patch
   trunk/buildroot/toolchain/gcc/4.2.4/305-libmudflap-susv3-legacy.patch
   trunk/buildroot/toolchain/gcc/4.2.4/306-libstdc++-namespace.patch
   trunk/buildroot/toolchain/gcc/4.2.4/307-locale_facets.patch
   trunk/buildroot/toolchain/gcc/4.2.4/402-libbackend_dep_gcov-iov.h.patch
   trunk/buildroot/toolchain/gcc/4.2.4/800-arm-bigendian.patch
   trunk/buildroot/toolchain/gcc/4.2.4/904-flatten-switch-stmt-00.patch
   trunk/buildroot/toolchain/gcc/4.2.4/910-soft-float.patch
   trunk/buildroot/toolchain/gcc/4.2.4/920-soft-float.patch

Modified:
   trunk/buildroot/toolchain/gcc/Config.in


Changeset:

Sorry, the patch is too large to include (4284 lines).
Please use ViewCVS to see it!

http://uclibc.org/cgi-bin/viewcvs.cgi?view=rev&root=svn&rev=22318
