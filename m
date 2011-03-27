From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 27 Mar 2011 21:48:30 +0200
Subject: [Buildroot] [git commit master 1/1] xlib_xtrans: drop pkgconfig
	patch now we're search usr/share/pkgconfig
Message-ID: <20110327195057.0439081914@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=1990a9cb926cfe41de482ae803d8e6d8c396ec6c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../xlib_xtrans-1.2.5-fix_pkgconfig_dir.patch      |   11 -----------
 1 files changed, 0 insertions(+), 11 deletions(-)
 delete mode 100644 package/x11r7/xlib_xtrans/xlib_xtrans-1.2.5-fix_pkgconfig_dir.patch

diff --git a/package/x11r7/xlib_xtrans/xlib_xtrans-1.2.5-fix_pkgconfig_dir.patch b/package/x11r7/xlib_xtrans/xlib_xtrans-1.2.5-fix_pkgconfig_dir.patch
deleted file mode 100644
index e8270c9..0000000
--- a/package/x11r7/xlib_xtrans/xlib_xtrans-1.2.5-fix_pkgconfig_dir.patch
+++ /dev/null
@@ -1,11 +0,0 @@
---- xlib_xtrans-1.2.5/Makefile.in.orig	2010-01-23 16:24:25.287333323 +0200
-+++ xlib_xtrans-1.2.5/Makefile.in	2010-01-23 16:25:06.336331430 +0200
-@@ -222,7 +222,7 @@ Xtransinclude_HEADERS = \
- 
- aclocaldir = $(datadir)/aclocal
- aclocal_DATA = xtrans.m4
--pkgconfigdir = $(datadir)/pkgconfig
-+pkgconfigdir = $(libdir)/pkgconfig
- pkgconfig_DATA = xtrans.pc
- EXTRA_DIST = xtrans.pc.in ${aclocal_DATA} ChangeLog Xtrans.mm
- MAINTAINERCLEANFILES = ChangeLog
-- 
1.7.3.4
