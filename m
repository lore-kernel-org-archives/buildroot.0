From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Apr 2014 23:21:03 +0200
Subject: [Buildroot] [git commit] mutt: Bump version to 1.5.23
Message-ID: <20140414213619.3AC7C9C79B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=dbd0244ff626115653b36e92d350ab60e5a2360e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

removed upstream applied patch mutt-02-automake.patch
http://dev.mutt.org/trac/changeset/0488deb39a35

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mutt/mutt-02-automake.patch |   16 ----------------
 package/mutt/mutt.mk                |    4 ++--
 2 files changed, 2 insertions(+), 18 deletions(-)

diff --git a/package/mutt/mutt-02-automake.patch b/package/mutt/mutt-02-automake.patch
deleted file mode 100644
index 19950a9..0000000
--- a/package/mutt/mutt-02-automake.patch
+++ /dev/null
@@ -1,16 +0,0 @@
-Fix for automake 1.12+
-http://dev.mutt.org/trac/ticket/3579
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-
-diff -Nura mutt-1.5.21.orig/configure.ac mutt-1.5.21/configure.ac
---- mutt-1.5.21.orig/configure.ac	2013-09-16 11:07:25.699781892 -0300
-+++ mutt-1.5.21/configure.ac	2013-09-16 11:07:45.120419960 -0300
-@@ -27,7 +27,6 @@
- 
- AC_PROG_CC
- AC_ISC_POSIX
--AM_C_PROTOTYPES
- if test "x$U" != "x"; then
-   AC_MSG_ERROR(Compiler not ANSI compliant)
- fi
diff --git a/package/mutt/mutt.mk b/package/mutt/mutt.mk
index 0c17589..5aa18eb 100644
--- a/package/mutt/mutt.mk
+++ b/package/mutt/mutt.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-MUTT_VERSION = 1.5.21
-MUTT_SITE = http://downloads.sourceforge.net/project/mutt/mutt-dev
+MUTT_VERSION = 1.5.23
+MUTT_SITE = http://downloads.sourceforge.net/project/mutt/mutt
 MUTT_LICENSE = GPLv2+
 MUTT_LICENSE_FILES = GPL
 MUTT_DEPENDENCIES = ncurses
