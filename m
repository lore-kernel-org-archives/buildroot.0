From: nkukard at uclibc.org <nkukard@uclibc.org>
Date: Fri, 28 Mar 2008 14:19:13 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc:  4.2.2
Message-ID: <20080328211913.181443C477@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: nkukard
Date: 2008-03-28 14:19:12 -0700 (Fri, 28 Mar 2008)
New Revision: 21541

Log:
* Added 4.2.2 patchset


Added:
   trunk/buildroot/toolchain/gcc/4.2.2/
   trunk/buildroot/toolchain/gcc/4.2.2/100-uclibc-conf.patch
   trunk/buildroot/toolchain/gcc/4.2.2/103-uclibc-conf-noupstream.patch
   trunk/buildroot/toolchain/gcc/4.2.2/104-gnuhurd-uclibc-conf.patch
   trunk/buildroot/toolchain/gcc/4.2.2/200-uclibc-locale.patch
   trunk/buildroot/toolchain/gcc/4.2.2/203-uclibc-locale-no__x.patch
   trunk/buildroot/toolchain/gcc/4.2.2/204-uclibc-locale-wchar_fix.patch
   trunk/buildroot/toolchain/gcc/4.2.2/205-uclibc-locale-update.patch
   trunk/buildroot/toolchain/gcc/4.2.2/300-libstdc++-pic.patch
   trunk/buildroot/toolchain/gcc/4.2.2/301-missing-execinfo_h.patch
   trunk/buildroot/toolchain/gcc/4.2.2/302-c99-snprintf.patch
   trunk/buildroot/toolchain/gcc/4.2.2/303-c99-complex-ugly-hack.patch
   trunk/buildroot/toolchain/gcc/4.2.2/304-index_macro.patch
   trunk/buildroot/toolchain/gcc/4.2.2/305-libmudflap-susv3-legacy.patch
   trunk/buildroot/toolchain/gcc/4.2.2/306-libstdc++-namespace.patch
   trunk/buildroot/toolchain/gcc/4.2.2/307-locale_facets.patch
   trunk/buildroot/toolchain/gcc/4.2.2/402-libbackend_dep_gcov-iov.h.patch
   trunk/buildroot/toolchain/gcc/4.2.2/800-arm-bigendian.patch
   trunk/buildroot/toolchain/gcc/4.2.2/904-flatten-switch-stmt-00.patch
   trunk/buildroot/toolchain/gcc/4.2.2/910-soft-float.patch


Changeset:

Sorry, the patch is too large to include (4213 lines).
Please use ViewCVS to see it!

http://uclibc.org/cgi-bin/viewcvs.cgi?view=rev&root=svn&rev=21541
