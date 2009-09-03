From: Will Newton <will.newton@gmail.com>
Date: Thu, 3 Sep 2009 17:04:57 +0100
Subject: [Buildroot] [PATCH] buildroot: Remove old CVS relics.
Message-ID: <87a5b0800909030904w38f82856pffd93068aa27ef93@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

A few files seem to have been left over from the CVS days.

Signed-off-by: Will Newton <will.newton@gmail.com>
---
 package/gnuconfig/.cvsignore               |    5 -----
 package/gnuconfig/CVS/Entries              |   14 --------------
 package/gnuconfig/CVS/Repository           |    1 -
 package/gnuconfig/CVS/Root                 |    1 -
 package/gnuconfig/testsuite/.cvsignore     |    1 -
 package/gnuconfig/testsuite/CVS/Entries    |    7 -------
 package/gnuconfig/testsuite/CVS/Repository |    1 -
 package/gnuconfig/testsuite/CVS/Root       |    1 -
 toolchain/elf2flt/elf2flt/.cvsignore       |    3 ---
 toolchain/elf2flt/elf2flt/CVS/Entries      |   17 -----------------
 toolchain/elf2flt/elf2flt/CVS/Repository   |    1 -
 toolchain/elf2flt/elf2flt/CVS/Root         |    1 -
 12 files changed, 0 insertions(+), 53 deletions(-)
 delete mode 100644 package/gnuconfig/.cvsignore
 delete mode 100644 package/gnuconfig/CVS/Entries
 delete mode 100644 package/gnuconfig/CVS/Repository
 delete mode 100644 package/gnuconfig/CVS/Root
 delete mode 100644 package/gnuconfig/testsuite/.cvsignore
 delete mode 100644 package/gnuconfig/testsuite/CVS/Entries
 delete mode 100644 package/gnuconfig/testsuite/CVS/Repository
 delete mode 100644 package/gnuconfig/testsuite/CVS/Root
 delete mode 100644 toolchain/elf2flt/elf2flt/.cvsignore
 delete mode 100644 toolchain/elf2flt/elf2flt/CVS/Entries
 delete mode 100644 toolchain/elf2flt/elf2flt/CVS/Repository
 delete mode 100644 toolchain/elf2flt/elf2flt/CVS/Root

diff --git a/package/gnuconfig/.cvsignore b/package/gnuconfig/.cvsignore
deleted file mode 100644
index 669c89f..0000000
--- a/package/gnuconfig/.cvsignore
+++ /dev/null
@@ -1,5 +0,0 @@
-.cvsignore
-README.buildroot
-gnuconfig.mk
-patches
-.svn
diff --git a/package/gnuconfig/CVS/Entries b/package/gnuconfig/CVS/Entries
deleted file mode 100644
index 07ca106..0000000
--- a/package/gnuconfig/CVS/Entries
+++ /dev/null
@@ -1,14 +0,0 @@
-D/doc////
-D/lib////
-D/m4////
-D/patches////
-D/po////
-D/scripts////
-D/src////
-D/tests////
-D/testsuite////
-/Makefile/1.6/Mon Sep 26 07:33:33 2005//
-/ChangeLog/1.387/Thu Sep 20 16:47:12 2007//
-/config.guess/1.368/Thu Sep 20 16:47:12 2007//
-/config.sub/1.356/Thu Sep 20 16:47:05 2007//
-/uname/1.5/Tue Aug 21 18:37:34 2007//
diff --git a/package/gnuconfig/CVS/Repository b/package/gnuconfig/CVS/Repository
deleted file mode 100644
index 04204c7..0000000
--- a/package/gnuconfig/CVS/Repository
+++ /dev/null
@@ -1 +0,0 @@
-config
diff --git a/package/gnuconfig/CVS/Root b/package/gnuconfig/CVS/Root
deleted file mode 100644
index 192e02e..0000000
--- a/package/gnuconfig/CVS/Root
+++ /dev/null
@@ -1 +0,0 @@
-:pserver:anonymous at cvs.savannah.gnu.org:/cvsroot/config
diff --git a/package/gnuconfig/testsuite/.cvsignore
b/package/gnuconfig/testsuite/.cvsignore
deleted file mode 100644
index e4dcdcf..0000000
--- a/package/gnuconfig/testsuite/.cvsignore
+++ /dev/null
@@ -1 +0,0 @@
-uname
diff --git a/package/gnuconfig/testsuite/CVS/Entries
b/package/gnuconfig/testsuite/CVS/Entries
deleted file mode 100644
index 31b1476..0000000
--- a/package/gnuconfig/testsuite/CVS/Entries
+++ /dev/null
@@ -1,7 +0,0 @@
-/.cvsignore/1.1/Mon Sep 26 07:33:33 2005//
-/uname.in/1.1/Mon Sep 26 07:33:33 2005//
-/config-guess.data/1.38/Thu Sep 20 16:47:13 2007//
-/config-guess.sh/1.5/Thu Sep 20 16:47:13 2007//
-/config-sub.data/1.47/Tue Aug 21 18:37:33 2007//
-/config-sub.sh/1.3/Thu Sep 20 16:47:13 2007//
-D
diff --git a/package/gnuconfig/testsuite/CVS/Repository
b/package/gnuconfig/testsuite/CVS/Repository
deleted file mode 100644
index 5337292..0000000
--- a/package/gnuconfig/testsuite/CVS/Repository
+++ /dev/null
@@ -1 +0,0 @@
-config/testsuite
diff --git a/package/gnuconfig/testsuite/CVS/Root
b/package/gnuconfig/testsuite/CVS/Root
deleted file mode 100644
index 192e02e..0000000
--- a/package/gnuconfig/testsuite/CVS/Root
+++ /dev/null
@@ -1 +0,0 @@
-:pserver:anonymous at cvs.savannah.gnu.org:/cvsroot/config
diff --git a/toolchain/elf2flt/elf2flt/.cvsignore
b/toolchain/elf2flt/elf2flt/.cvsignore
deleted file mode 100644
index 18cff9a..0000000
--- a/toolchain/elf2flt/elf2flt/.cvsignore
+++ /dev/null
@@ -1,3 +0,0 @@
-.cvsignore
-.svn
-maketarball.sh
diff --git a/toolchain/elf2flt/elf2flt/CVS/Entries
b/toolchain/elf2flt/elf2flt/CVS/Entries
deleted file mode 100644
index 1b3750f..0000000
--- a/toolchain/elf2flt/elf2flt/CVS/Entries
+++ /dev/null
@@ -1,17 +0,0 @@
-/LICENSE.TXT/1.1/Tue Jan 10 04:34:09 2006//
-/README/1.5/Tue Jan 10 04:34:09 2006/-ko/
-/config.guess/1.2/Tue Jan 10 04:34:08 2006/-ko/
-/e1-elf2flt.ld/1.1/Tue Jan 10 04:34:09 2006//
-/flat.h/1.6/Tue Jan 10 04:34:08 2006/-ko/
-/install-sh/1.1.1.1/Tue Jan 10 04:34:08 2006/-ko/
-/stubs.c/1.1/Tue Jan 10 04:34:08 2006//
-/config.sub/1.8/Wed Jan 11 13:36:39 2006/-ko/
-/cygwin-elf.h/1.4/Wed Jan 11 13:36:39 2006//
-/Makefile.in/1.17/Result of merge/-ko/
-/configure/1.12/Sun Jan 28 05:27:28 2007/-ko/
-/configure.in/1.10/Sun Jan 28 05:27:28 2007/-ko/
-/elf2flt.c/1.46/Result of merge/-ko/
-/elf2flt.ld/1.15/Sun Jan 28 05:27:28 2007/-ko/
-/flthdr.c/1.10/Sun Jan 28 05:27:28 2007/-ko/
-/ld-elf2flt.in/1.15/Sun Jan 28 05:27:28 2007//
-D
diff --git a/toolchain/elf2flt/elf2flt/CVS/Repository
b/toolchain/elf2flt/elf2flt/CVS/Repository
deleted file mode 100644
index 61a695f..0000000
--- a/toolchain/elf2flt/elf2flt/CVS/Repository
+++ /dev/null
@@ -1 +0,0 @@
-elf2flt
diff --git a/toolchain/elf2flt/elf2flt/CVS/Root
b/toolchain/elf2flt/elf2flt/CVS/Root
deleted file mode 100644
index 0b9f527..0000000
--- a/toolchain/elf2flt/elf2flt/CVS/Root
+++ /dev/null
@@ -1 +0,0 @@
-:pserver:anonymous at cvs.uclinux.org:/var/cvs
-- 
1.5.5.2
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0001-buildroot-Remove-old-CVS-relics.patch
Type: application/octet-stream
Size: 5778 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090903/16553377/attachment.obj>
