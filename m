Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4C20C282D0
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:48:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 82382849A8;
	Fri, 28 Feb 2025 16:48:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ul6J0jVycOAI; Fri, 28 Feb 2025 16:48:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B7CBB849A6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B7CBB849A6;
	Fri, 28 Feb 2025 16:48:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 212851DD
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:34:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AAAC142E53
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zkKwCHbGgr2r for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:30:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B83DB424EC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B83DB424EC
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B238C8769C; Fri, 28 Feb 2025 16:29:54 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 30 Dec 2024 00:04:13 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: f6fe892141cd4c8b6dd934df92eb1fe7d9469e0c
X-Git-Newrev: f7fe84508a14641617586bc481a08cb3face0477
X-Patchwork-Hint: ignore
Message-Id: <20250228162954.B238C8769C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/procps-ng: bump
 version to 4.0.5
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f7fe84508a14641617586bc481a08cb3face0477
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Patch 0001 is dropped as it's upstream as of
ca004d4657d5e8b468a4552ede429be53193a3a9.

Patch 0002 is dropped as it's upstream as of
263fe04f9ed6f3f40fdb7ce249221e03dc926c9b.

Patch 0003 is dropped as it's upstream as of
2507bc475782ff5e0541d37c780dff1e293c9553.

Patch 0004 is dropped as it's upstream as of
587efb47df7ddbfda4e6abdd1e7792a2531a238f.

Patch 0005 is dropped as it's upstream as of
5acbb5dc1587d688de646d739a97251eb893bbb0.

Therefore AUTORECONF = YES can be dropped as we're no longer patching
the package.

Release notes:
https://gitlab.com/procps-ng/procps/-/releases/v4.0.5

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../0001-build-sys-Add-systemd-elogind-to-w.patch  | 48 -----------
 package/procps-ng/0002-fix-ncurses-h-include.patch | 55 ------------
 .../0003-build-sys-Fix-pidfd_open-checking.patch   | 99 ----------------------
 ...4-build-sys-Fix-define-of-HAVE_PIDFD_OPEN.patch | 37 --------
 ...p-Include-sys-syscall.h-if-making-pidwait.patch | 41 ---------
 package/procps-ng/procps-ng.hash                   |  8 +-
 package/procps-ng/procps-ng.mk                     |  8 +-
 7 files changed, 5 insertions(+), 291 deletions(-)

diff --git a/package/procps-ng/0001-build-sys-Add-systemd-elogind-to-w.patch b/package/procps-ng/0001-build-sys-Add-systemd-elogind-to-w.patch
deleted file mode 100644
index 4a8b2a6a8b..0000000000
--- a/package/procps-ng/0001-build-sys-Add-systemd-elogind-to-w.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From 788248ee631b3b5f82073c36320fc3f4a3c8f9ba Mon Sep 17 00:00:00 2001
-From: Craig Small <csmall@dropbear.xyz>
-Date: Thu, 31 Aug 2023 22:24:23 +1000
-Subject: [PATCH] build-sys: Add systemd/elogind to w
-
-Depending on the compiler flags, w needs to be explictly linked
-to libsystemd or elogind even though libproc2 is linked to it.
-
-Signed-off-by: Craig Small <csmall@dropbear.xyz>
-Upstream: https://gitlab.com/procps-ng/procps/-/commit/ca004d4657d5e8b468a4552ede429be53193a3a9
-Signed-off-by: Hugo Cornelis <hugo.cornelis@essensium.com>
----
- Makefile.am | 7 +++++++
- NEWS        | 3 +++
- 2 files changed, 10 insertions(+)
-
-diff --git a/Makefile.am b/Makefile.am
-index f70c8fb1..ddfc0141 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -149,6 +149,13 @@ endif
- 
- dist_man_MANS += man/w.1
- src_w_SOURCES = src/w.c local/fileutils.c
-+src_w_LDADD = $(LDADD)
-+if WITH_SYSTEMD
-+src_w_LDADD += @SYSTEMD_LIBS@
-+endif
-+if WITH_ELOGIND
-+src_w_LDADD += @ELOGIND_LIBS@
-+endif
- else
-   EXTRA_DIST += man/w.1
- endif
-diff --git a/NEWS b/NEWS
-index 3f2158d4..4ad9f74e 100644
---- a/NEWS
-+++ b/NEWS
-@@ -1,3 +1,6 @@
-+procps-ng-NEXT
-+---------------
-+
- procps-ng-4.0.4
- ---------------
-   * library (API & ABI unchanged)
--- 
-2.34.1
-
diff --git a/package/procps-ng/0002-fix-ncurses-h-include.patch b/package/procps-ng/0002-fix-ncurses-h-include.patch
deleted file mode 100644
index 619126b863..0000000000
--- a/package/procps-ng/0002-fix-ncurses-h-include.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From 263fe04f9ed6f3f40fdb7ce249221e03dc926c9b Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Wed, 24 Jul 2024 09:51:00 +0200
-Subject: [PATCH] fix ncurses.h include
-
-Commit 58559a5b64a3634460536d6397ca382a54b599f0 was not backported from
-3.3.17 to 4.0.0 resulting in the following build failure when ncursesw
-headers are not installed in ../usr/include/ncursesw/..:
-
-src/watch.c:56:11: fatal error: ncursesw/ncurses.h: No such file or directory
-   56 | # include <ncursesw/ncurses.h>
-      |           ^~~~~~~~~~~~~~~~~~~~
-
-Fixes:
- - http://autobuild.buildroot.org/results/b7573be2e78f3d224f48cb3f52087e3d227d58e3
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-
-Upstream: https://gitlab.com/procps-ng/procps/-/commit/263fe04f9ed6f3f40fdb7ce249221e03dc926c9b
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
-[Bernd: backported to version 4.0.4]
----
- configure.ac | 2 +-
- src/watch.c  | 5 ++++-
- 2 files changed, 5 insertions(+), 2 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index d433901f..38350aaf 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -64,7 +64,7 @@ PROCPS_PROG_PO4A
- 
- # Checks for header files.
- AC_HEADER_MAJOR
--AC_CHECK_HEADERS([arpa/inet.h fcntl.h float.h langinfo.h libintl.h limits.h locale.h stdint.h stdio_ext.h stdlib.h string.h sys/file.h sys/ioctl.h sys/param.h sys/time.h termios.h unistd.h utmp.h utmpx.h values.h wchar.h wctype.h])
-+AC_CHECK_HEADERS([arpa/inet.h fcntl.h float.h langinfo.h libintl.h limits.h locale.h ncursesw/ncurses.h stdint.h stdio_ext.h stdlib.h string.h sys/file.h sys/ioctl.h sys/param.h sys/time.h termios.h unistd.h utmp.h utmpx.h values.h wchar.h wctype.h])
- 
- # Checks for typedefs, structures, and compiler characteristics.
- AC_CHECK_HEADER_STDBOOL
-diff --git a/src/watch.c b/src/watch.c
-index ef638e00..7ec634b6 100644
---- a/src/watch.c
-+++ b/src/watch.c
-@@ -53,6 +53,8 @@
- # define _XOPEN_SOURCE_EXTENDED 1
- # include <wchar.h>
- # include <wctype.h>
-+#endif
-+#ifdef HAVE_NCURSESW_NCURSES_H
- # include <ncursesw/ncurses.h>
- #else
- # include <ncurses.h>
--- 
-GitLab
diff --git a/package/procps-ng/0003-build-sys-Fix-pidfd_open-checking.patch b/package/procps-ng/0003-build-sys-Fix-pidfd_open-checking.patch
deleted file mode 100644
index fc7e092347..0000000000
--- a/package/procps-ng/0003-build-sys-Fix-pidfd_open-checking.patch
+++ /dev/null
@@ -1,99 +0,0 @@
-From f37d178d5c25c547835d054fbb1eda32c25034b3 Mon Sep 17 00:00:00 2001
-From: Craig Small <csmall@dropbear.xyz>
-Date: Mon, 30 Sep 2024 17:26:01 +1000
-Subject: [PATCH] build-sys: Fix pidfd_open checking
-
-The previous build setup would check for pidfd_open using
-AC_CHECK_FUNC and would be incorrectly reported as true.
-
-Also, if pidfd_open() and __NR_pidfd_open were not present,
-pidwait would silently not be built.
-
-So, changes:
- compile a small programin using pidfd_open to test it properly
- conditionally try to find NR_pidfd_open if the function fails
- complain if neither are present
- have --disable-pidwait configure option so you are explicit in
- not wanting and knowing you wont get pidwait
-
-References:
- #352
- commit d9c3e3676d86094abaa239b3218f57bf49d70b4f
- commit 17f94796a9b3c4f1ff28829107a82107dcb362b4
-
-Signed-off-by: Craig Small <csmall@dropbear.xyz>
-
-Upstream: https://gitlab.com/procps-ng/procps/-/commit/2507bc475782ff5e0541d37c780dff1e293c9553
-
-Signed-off-by: Scott Fan <fancp2007@gmail.com>
-[Scott: backported to version 4.0.4]
----
- configure.ac | 45 ++++++++++++++++++++++++++++++---------------
- 1 file changed, 30 insertions(+), 15 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index fec27e3f..0719fcd1 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -170,21 +170,6 @@ AC_TRY_COMPILE([#include <errno.h>],
- 		AC_MSG_RESULT(yes),
- 		AC_MSG_RESULT(no))
- 
--AC_CHECK_FUNC([pidfd_open], [enable_pidwait=yes], [
--  AC_MSG_CHECKING([for __NR_pidfd_open])
--  AC_COMPILE_IFELSE([AC_LANG_SOURCE([
--#include <sys/syscall.h>
--#ifndef __NR_pidfd_open
--#error __NR_pidfd_open not defined
--#endif
--    ])], [enable_pidwait=yes], [enable_pidwait=no])
--  AC_MSG_RESULT([$enable_pidwait])
--])
--if test "$enable_pidwait" = yes; then
--  AC_DEFINE([ENABLE_PIDWAIT], [1], [Enable pidwait])
--fi
--AM_CONDITIONAL([BUILD_PIDWAIT], [test x$enable_pidwait = xyes])
--
- dnl watch8bit must be before the AC_ARG_WITH set as it sets up ncurses
- AC_SUBST([WITH_WATCH8BIT])
- AC_ARG_ENABLE([watch8bit],
-@@ -321,6 +306,36 @@ AC_ARG_ENABLE([pidof],
- )
- AM_CONDITIONAL(BUILD_PIDOF, test "x$enable_pidof" = xyes)
- 
-+# If pidwait is enabled, we need either pidfd_open() or __NR_pidfd_open need to be defined
-+# Cannot use AC_CHECK_FUNC as it (incorrectly) passes with pidfd_open missing
-+AC_ARG_ENABLE([pidwait],
-+  AS_HELP_STRING([--disable-pidwait], [do not build pidwait]),
-+  [], [
-+    enable_pidwait=yes
-+    AC_DEFINE(ENABLE_PIDWAIT, 1, [enable pidwait])
-+  ]
-+)
-+AM_CONDITIONAL(BUILD_PIDWAIT, test "x$enable_pidwait" = xyes)
-+AC_MSG_CHECKING([for pidfd_open()])
-+AC_LINK_IFELSE([AC_LANG_PROGRAM([], [[ [pidfd_open(1,1)]]])],
-+  have_pidfd_open=yes; AC_MSG_RESULT([yes]) ,
-+  have_pidfd_open=no; AC_MSG_RESULT([no])
-+  )
-+
-+AS_IF([[test "x$enable_pidwait" = xyes -a "x$have_pidfd_open" = xno]],
-+   AC_MSG_CHECKING([for __NR_pidfd_open])
-+   AC_COMPILE_IFELSE([AC_LANG_SOURCE([
-+#include <sys/syscall.h>
-+#ifndef __NR_pidfd_open
-+#error __NR_pidfd_open not defined
-+#endif
-+      ])],
-+      AC_MSG_RESULT([yes]),
-+      AC_MSG_RESULT([no])
-+      AC_MSG_ERROR([Neither pidfd_open or __NR_pidfd_open found. Disable pidwait with configure option --disable-pidwait])
-+    )
-+   ,[])
-+
- AC_ARG_ENABLE([kill],
-   AS_HELP_STRING([--disable-kill], [do not build kill]),
-   [], [enable_kill=yes]
--- 
-2.43.0
-
diff --git a/package/procps-ng/0004-build-sys-Fix-define-of-HAVE_PIDFD_OPEN.patch b/package/procps-ng/0004-build-sys-Fix-define-of-HAVE_PIDFD_OPEN.patch
deleted file mode 100644
index aa65df7706..0000000000
--- a/package/procps-ng/0004-build-sys-Fix-define-of-HAVE_PIDFD_OPEN.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 1e2d53e1d86cb75e8f39b42b9a5c409e5d3261ed Mon Sep 17 00:00:00 2001
-From: oli-ben <24815225-oli-ben@users.noreply.gitlab.com>
-Date: Wed, 27 Nov 2024 20:17:11 +0000
-Subject: [PATCH] build-sys: Fix define of HAVE_PIDFD_OPEN
-
-Fix cross-compilation issues when using GCC-12.3
-* configure fails to detect that the sysroot does support the pidfd_open
-  syscall wrapper
-* configure fails to define HAVE_PIDFD_OPEN which is used in pgrep.c,
-  so it fails building, because __NR_pidfd_open is then undefined
-
-Upstream: https://gitlab.com/procps-ng/procps/-/commit/587efb47df7ddbfda4e6abdd1e7792a2531a238f
-
-Signed-off-by: Scott Fan <fancp2007@gmail.com>
-[Scott: backported to version 4.0.4]
----
- configure.ac | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 0719fcd1..6242a8f8 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -317,8 +317,8 @@ AC_ARG_ENABLE([pidwait],
- )
- AM_CONDITIONAL(BUILD_PIDWAIT, test "x$enable_pidwait" = xyes)
- AC_MSG_CHECKING([for pidfd_open()])
--AC_LINK_IFELSE([AC_LANG_PROGRAM([], [[ [pidfd_open(1,1)]]])],
--  have_pidfd_open=yes; AC_MSG_RESULT([yes]) ,
-+AC_LINK_IFELSE([AC_LANG_PROGRAM([], [[pidfd_open(1,1)]])],
-+  have_pidfd_open=yes; AC_DEFINE(HAVE_PIDFD_OPEN, 1, [pidfd_open is defined]) AC_MSG_RESULT([yes]),
-   have_pidfd_open=no; AC_MSG_RESULT([no])
-   )
- 
--- 
-2.43.0
-
diff --git a/package/procps-ng/0005-pgrep-Include-sys-syscall.h-if-making-pidwait.patch b/package/procps-ng/0005-pgrep-Include-sys-syscall.h-if-making-pidwait.patch
deleted file mode 100644
index 74f93c8e49..0000000000
--- a/package/procps-ng/0005-pgrep-Include-sys-syscall.h-if-making-pidwait.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 81ded587d2484b6f470f2d5c837c5591491377ce Mon Sep 17 00:00:00 2001
-From: Craig Small <csmall@dropbear.xyz>
-Date: Thu, 28 Nov 2024 07:20:42 +1100
-Subject: [PATCH] pgrep: Include sys/syscall.h if making pidwait
-
-sys/syscall.h would only be included if pidwait was made
-and we found pidfd_open() The previous commit fixed the
-finding part, but in fact we want sys/syscall.h either
-way because syscall() is defined there too.
-
-Most of the time the header is included by other headers
-but adding it explicitly means if that header is removed or
-changed it still works.
-
-Signed-off-by: Craig Small <csmall@dropbear.xyz>
-
-Upstream: https://gitlab.com/procps-ng/procps/-/commit/5acbb5dc1587d688de646d739a97251eb893bbb0
-
-Signed-off-by: Scott Fan <fancp2007@gmail.com>
-[Scott: backported to version 4.0.4]
----
- src/pgrep.c | 2 --
- 1 file changed, 2 deletions(-)
-
-diff --git a/src/pgrep.c b/src/pgrep.c
-index d8e57dff..a2607532 100644
---- a/src/pgrep.c
-+++ b/src/pgrep.c
-@@ -44,9 +44,7 @@
- 
- #ifdef ENABLE_PIDWAIT
- #include <sys/epoll.h>
--#ifndef HAVE_PIDFD_OPEN
- #include <sys/syscall.h>
--#endif /* !HAVE_PIDFD_OPEN */
- #endif
- 
- /* EXIT_SUCCESS is 0 */
--- 
-2.43.0
-
diff --git a/package/procps-ng/procps-ng.hash b/package/procps-ng/procps-ng.hash
index 0d9cd9a835..21c661192c 100644
--- a/package/procps-ng/procps-ng.hash
+++ b/package/procps-ng/procps-ng.hash
@@ -1,8 +1,8 @@
 # From http://sourceforge.net/projects/procps-ng/files/Production/
-md5  2f747fc7df8ccf402d03e375c565cf96  procps-ng-4.0.4.tar.xz
-sha1  2b859acd7060e9898ac457dbd26dbebf563cc44b  procps-ng-4.0.4.tar.xz
+md5  90803e64f51f192f3325d25c3335d057  procps-ng-4.0.5.tar.xz
+sha1  a36b8ab95950addb4b34251fcf23195c45a63eda  procps-ng-4.0.5.tar.xz
 # Locally calculated after checking signature
-# http://downloads.sourceforge.net/project/procps-ng/Production/procps-ng-4.0.4.tar.xz.asc
-sha256  22870d6feb2478adb617ce4f09a787addaf2d260c5a8aa7b17d889a962c5e42e  procps-ng-4.0.4.tar.xz
+# http://downloads.sourceforge.net/project/procps-ng/Production/procps-ng-4.0.5.tar.xz.asc
+sha256  c2e6d193cc78f84cd6ddb72aaf6d5c6a9162f0470e5992092057f5ff518562fa  procps-ng-4.0.5.tar.xz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  681e386e44a19d7d0674b4320272c90e66b6610b741e7e6305f8219c42e85366  COPYING.LIB
diff --git a/package/procps-ng/procps-ng.mk b/package/procps-ng/procps-ng.mk
index 9200b6faa6..f4eadcb547 100644
--- a/package/procps-ng/procps-ng.mk
+++ b/package/procps-ng/procps-ng.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PROCPS_NG_VERSION = 4.0.4
+PROCPS_NG_VERSION = 4.0.5
 PROCPS_NG_SOURCE = procps-ng-$(PROCPS_NG_VERSION).tar.xz
 PROCPS_NG_SITE = http://downloads.sourceforge.net/project/procps-ng/Production
 PROCPS_NG_LICENSE = GPL-2.0+, LGPL-2.0+ (libproc and libps)
@@ -14,12 +14,6 @@ PROCPS_NG_INSTALL_STAGING = YES
 PROCPS_NG_DEPENDENCIES = ncurses host-pkgconf $(TARGET_NLS_DEPENDENCIES)
 PROCPS_NG_CONF_OPTS = LIBS=$(TARGET_NLS_LIBS)
 
-# Applying 0001-build-sys-Add-systemd-elogind-to-w.patch touches Makefile.am
-# Applying 0002-fix-ncurses-h-include.patch touches configure.ac
-# Applying 0003-build-sys-Fix-pidfd_open-checking.patch touches configure.ac
-# Applying 0004-build-sys-Fix-define-of-HAVE_PIDFD_OPEN.patch touches configure.ac
-PROCPS_NG_AUTORECONF = YES
-
 ifeq ($(BR2_PACKAGE_SYSTEMD),y)
 PROCPS_NG_DEPENDENCIES += systemd
 PROCPS_NG_CONF_OPTS += --with-systemd
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
