From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 27 May 2013 23:59:09 +0200
Subject: [Buildroot] [git commit] Remove useless CVS related files
Message-ID: <20130527221101.7D6C89A5E8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=32a596899975df230e2b9921835ccfb277755a63
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes bug #5912.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 support/gnuconfig/.cvsignore             |    5 -----
 toolchain/elf2flt/elf2flt/.cvsignore     |    3 ---
 toolchain/elf2flt/elf2flt/CVS/Entries    |   17 -----------------
 toolchain/elf2flt/elf2flt/CVS/Repository |    1 -
 toolchain/elf2flt/elf2flt/CVS/Root       |    1 -
 5 files changed, 0 insertions(+), 27 deletions(-)

diff --git a/support/gnuconfig/.cvsignore b/support/gnuconfig/.cvsignore
deleted file mode 100644
index 669c89f..0000000
--- a/support/gnuconfig/.cvsignore
+++ /dev/null
@@ -1,5 +0,0 @@
-.cvsignore
-README.buildroot
-gnuconfig.mk
-patches
-.svn
diff --git a/toolchain/elf2flt/elf2flt/.cvsignore b/toolchain/elf2flt/elf2flt/.cvsignore
deleted file mode 100644
index 18cff9a..0000000
--- a/toolchain/elf2flt/elf2flt/.cvsignore
+++ /dev/null
@@ -1,3 +0,0 @@
-.cvsignore
-.svn
-maketarball.sh
diff --git a/toolchain/elf2flt/elf2flt/CVS/Entries b/toolchain/elf2flt/elf2flt/CVS/Entries
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
diff --git a/toolchain/elf2flt/elf2flt/CVS/Repository b/toolchain/elf2flt/elf2flt/CVS/Repository
deleted file mode 100644
index 61a695f..0000000
--- a/toolchain/elf2flt/elf2flt/CVS/Repository
+++ /dev/null
@@ -1 +0,0 @@
-elf2flt
diff --git a/toolchain/elf2flt/elf2flt/CVS/Root b/toolchain/elf2flt/elf2flt/CVS/Root
deleted file mode 100644
index 0b9f527..0000000
--- a/toolchain/elf2flt/elf2flt/CVS/Root
+++ /dev/null
@@ -1 +0,0 @@
-:pserver:anonymous at cvs.uclinux.org:/var/cvs
