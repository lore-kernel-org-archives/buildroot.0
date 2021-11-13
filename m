Return-Path: <SRS0=SOkI=QA=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 841FCC433EF
	for <buildroot@archiver.kernel.org>; Sat, 13 Nov 2021 14:39:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 331F460F46
	for <buildroot@archiver.kernel.org>; Sat, 13 Nov 2021 14:39:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 331F460F46
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 06D6280D74;
	Sat, 13 Nov 2021 14:39:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5uaCSfHkYV3h; Sat, 13 Nov 2021 14:39:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C937980DB4;
	Sat, 13 Nov 2021 14:39:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 849501BF23C
 for <buildroot@lists.busybox.net>; Sat, 13 Nov 2021 14:39:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6D62380DB4
 for <buildroot@lists.busybox.net>; Sat, 13 Nov 2021 14:39:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iupgUfgMksrg for <buildroot@lists.busybox.net>;
 Sat, 13 Nov 2021 14:38:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id EA58E80CF9
 for <buildroot@buildroot.org>; Sat, 13 Nov 2021 14:38:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id CD8818C9BD; Sat, 13 Nov 2021 14:34:54 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 13 Nov 2021 15:37:57 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 39a796c21444196b2de8c3bb1ff0c12d2123afa8
X-Git-Newrev: d9185c6ba38430a017ed996c4180e141881ba570
X-Patchwork-Hint: ignore
Message-Id: <20211113143454.CD8818C9BD@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next]
 package/x11r7/xserver_xorg-server: bump version to 21.1.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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
Content-Type: multipart/mixed; boundary="===============8352737878482947284=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8352737878482947284==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=d9185c6ba38430a017ed996c4180e141881ba570
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Removed patches which were applied upstream:

0001-modesettings-needs-dri2.patch
https://gitlab.freedesktop.org/xorg/xserver/-/commit/9c81b8f5b5d7bc987f73e8ef01a81e61205e58ee

0003-hw-xwayland-Makefile.am-fix-build-without-glx.patch
https://gitlab.freedesktop.org/xorg/xserver/-/commit/836f93de99b35050d78d61d3654f7c5655184144

0004-hw-xfree86-common-xf86Init.c-fix-build-without-glx.patch
https://gitlab.freedesktop.org/xorg/xserver/-/commit/49456e0a37fac7bc9d1f01bc1519fb0d699956db

0005-Fix-segfault-on-probing-a-non-PCI-platform-device-on.patch
https://gitlab.freedesktop.org/xorg/xserver/-/commit/e50c85f4ebf559a3bac4817b41074c43d4691779

0006-compiler.h-don-t-define-inb-outb-and-friends-on-mips.patch
https://gitlab.freedesktop.org/xorg/xserver/-/commit/0148a15da1616a868d71abe1b56e3f28cc79533c

Renumbered remaining patch.

Removed xwayland options:
https://gitlab.freedesktop.org/xorg/xserver/-/commit/4ee66f574a70948ca90a5db94dd666a389a5ff3e

Added dependency to xlib_libxcvt:
https://gitlab.freedesktop.org/xorg/xserver/-/commit/a4ab57cb748674823744a8ef5a0b416ee553efe8

Release notes:
https://lists.x.org/archives/xorg-announce/2021-October/003115.html
https://lists.x.org/archives/xorg-announce/2021-November/003116.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ... => 0001-include-misc.h-fix-uClibc-build.patch} |  0
 .../0001-modesettings-needs-dri2.patch             | 20 ------
 ...wayland-Makefile.am-fix-build-without-glx.patch | 45 -------------
 ...6-common-xf86Init.c-fix-build-without-glx.patch | 45 -------------
 ...t-on-probing-a-non-PCI-platform-device-on.patch | 33 ----------
 ...don-t-define-inb-outb-and-friends-on-mips.patch | 73 ----------------------
 package/x11r7/xserver_xorg-server/Config.in        |  1 +
 .../xserver_xorg-server/xserver_xorg-server.hash   |  6 +-
 .../xserver_xorg-server/xserver_xorg-server.mk     | 14 +----
 9 files changed, 6 insertions(+), 231 deletions(-)

diff --git a/package/x11r7/xserver_xorg-server/0002-include-misc.h-fix-uClibc-build.patch b/package/x11r7/xserver_xorg-server/0001-include-misc.h-fix-uClibc-build.patch
similarity index 100%
rename from package/x11r7/xserver_xorg-server/0002-include-misc.h-fix-uClibc-build.patch
rename to package/x11r7/xserver_xorg-server/0001-include-misc.h-fix-uClibc-build.patch
diff --git a/package/x11r7/xserver_xorg-server/0001-modesettings-needs-dri2.patch b/package/x11r7/xserver_xorg-server/0001-modesettings-needs-dri2.patch
deleted file mode 100644
index 74917720cb..0000000000
--- a/package/x11r7/xserver_xorg-server/0001-modesettings-needs-dri2.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-Kernel modesettings support also depends on dri2, see
-http://cgit.freedesktop.org/xorg/xserver/tree/hw/xfree86/drivers/modesetting/Makefile.am#n46
-
-Patch sent upstream: https://gitlab.freedesktop.org/xorg/xserver/issues/479
-
-[rebased for version 1.20.0]
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-
-diff -uNr xorg-server-1.17.2.org/configure.ac xorg-server-1.17.2/configure.ac
---- xorg-server-1.17.2.org/configure.ac	2015-06-16 17:42:40.000000000 +0200
-+++ xorg-server-1.17.2/configure.ac	2015-08-08 10:44:59.702382624 +0200
-@@ -1962,7 +1962,7 @@
- 	        XORG_SYS_LIBS="$XORG_SYS_LIBS $XORG_MODULES_LIBS"
- 	fi
- 
--	if test "x$DRM" = xyes; then
-+	if test "x$DRM" = xyes -a "x$DRI2" = xyes; then
- 		XORG_DRIVER_MODESETTING=yes
- 	fi
- 
diff --git a/package/x11r7/xserver_xorg-server/0003-hw-xwayland-Makefile.am-fix-build-without-glx.patch b/package/x11r7/xserver_xorg-server/0003-hw-xwayland-Makefile.am-fix-build-without-glx.patch
deleted file mode 100644
index 5f19a26d14..0000000000
--- a/package/x11r7/xserver_xorg-server/0003-hw-xwayland-Makefile.am-fix-build-without-glx.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From b1d2a82d644518c1a75775244ac63be738aaf062 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Fri, 19 Apr 2019 10:19:50 +0200
-Subject: [PATCH] hw/xwayland/Makefile.am: fix build without glx
-
-Commit d8ec33fe0542141aed1d9016d2ecaf52da944b4b added libglxvnd.la to
-Xwayland_LDFLAGS but GLX can be disabled through --disable-glx.
-In this case, build fails on:
-
-make[3]: *** No rule to make target '../../glx/libglxvnd.la', needed by 'Xwayland'.  Stop.
-make[3]: *** Waiting for unfinished jobs....
-
-Fixes:
- - http://autobuild.buildroot.org/results/397f8098c57fc6c88aa12dc8d35ebb1b933d52ef
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status:
-https://gitlab.freedesktop.org/xorg/xserver/merge_requests/173]
----
- hw/xwayland/Makefile.am | 6 +++++-
- 1 file changed, 5 insertions(+), 1 deletion(-)
-
-diff --git a/hw/xwayland/Makefile.am b/hw/xwayland/Makefile.am
-index bc1cb8506..502879e2a 100644
---- a/hw/xwayland/Makefile.am
-+++ b/hw/xwayland/Makefile.am
-@@ -21,10 +21,14 @@ Xwayland_SOURCES =				\
- 	$(top_srcdir)/Xi/stubs.c		\
- 	$(top_srcdir)/mi/miinitext.c
- 
-+if GLX
-+GLXVND_LIB = $(top_builddir)/glx/libglxvnd.la
-+endif
-+
- Xwayland_LDADD =				\
- 	$(glamor_lib)				\
- 	$(XWAYLAND_LIBS)			\
--	$(top_builddir)/glx/libglxvnd.la	\
-+	$(GLXVND_LIB)				\
- 	$(XWAYLAND_SYS_LIBS)			\
- 	$(top_builddir)/Xext/libXvidmode.la	\
- 	$(XSERVER_SYS_LIBS)
--- 
-2.20.1
-
diff --git a/package/x11r7/xserver_xorg-server/0004-hw-xfree86-common-xf86Init.c-fix-build-without-glx.patch b/package/x11r7/xserver_xorg-server/0004-hw-xfree86-common-xf86Init.c-fix-build-without-glx.patch
deleted file mode 100644
index de086fb665..0000000000
--- a/package/x11r7/xserver_xorg-server/0004-hw-xfree86-common-xf86Init.c-fix-build-without-glx.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 49456e0a37fac7bc9d1f01bc1519fb0d699956db Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Fri, 27 Dec 2019 23:33:37 +0100
-Subject: [PATCH] hw/xfree86/common/xf86Init.c: fix build without glx
-
-Since commit d8ec33fe0542141aed1d9016d2ecaf52da944b4b, an include on
-glxvndabi.h has been added to hw/xfree86/common/xf86Init.c
-
-However, if glx is disabled through --disable-glx and GLX headers are
-not installed in the build's environment, build fails on:
-
-In file included from xf86Init.c:81:
-../../../include/glxvndabi.h:64:10: fatal error: GL/glxproto.h: No such file or directory
-   64 | #include <GL/glxproto.h>
-      |          ^~~~~~~~~~~~~~~
-
-Fix this failure by removing this include which does not seem to be
-needed (an other option would have been to keep it under an ifdef GLXEXT
-block)
-
-Fixes:
- - http://autobuild.buildroot.org/results/de838a843f97673d1381a55fd4e9b07164693913
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://gitlab.freedesktop.org/xorg/xserver/commit/49456e0a37fac7bc9d1f01bc1519fb0d699956db]
----
- hw/xfree86/common/xf86Init.c | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/hw/xfree86/common/xf86Init.c b/hw/xfree86/common/xf86Init.c
-index 0631c7237..e6fb11398 100644
---- a/hw/xfree86/common/xf86Init.c
-+++ b/hw/xfree86/common/xf86Init.c
-@@ -78,7 +78,6 @@
- #include "xf86InPriv.h"
- #include "picturestr.h"
- #include "randrstr.h"
--#include "glxvndabi.h"
- #include "xf86Bus.h"
- #ifdef XSERVER_LIBPCIACCESS
- #include "xf86VGAarbiter.h"
--- 
-2.24.1
-
diff --git a/package/x11r7/xserver_xorg-server/0005-Fix-segfault-on-probing-a-non-PCI-platform-device-on.patch b/package/x11r7/xserver_xorg-server/0005-Fix-segfault-on-probing-a-non-PCI-platform-device-on.patch
deleted file mode 100644
index 7802fd96c9..0000000000
--- a/package/x11r7/xserver_xorg-server/0005-Fix-segfault-on-probing-a-non-PCI-platform-device-on.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From e50c85f4ebf559a3bac4817b41074c43d4691779 Mon Sep 17 00:00:00 2001
-From: Eric Anholt <eric@anholt.net>
-Date: Fri, 26 Oct 2018 17:47:30 -0700
-Subject: [PATCH] Fix segfault on probing a non-PCI platform device on a system
- with PCI.
-
-Some Broadcom set-top-box boards have PCI busses, but the GPU is still
-probed through DT.  We would dereference a null busid here in that
-case.
-
-Signed-off-by: Eric Anholt <eric@anholt.net>
-Backported from: e50c85f4ebf559a3bac4817b41074c43d4691779
-Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
----
- hw/xfree86/common/xf86platformBus.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/hw/xfree86/common/xf86platformBus.c b/hw/xfree86/common/xf86platformBus.c
-index cef47da03..dadbac6c8 100644
---- a/hw/xfree86/common/xf86platformBus.c
-+++ b/hw/xfree86/common/xf86platformBus.c
-@@ -289,7 +289,7 @@ xf86platformProbe(void)
-     for (i = 0; i < xf86_num_platform_devices; i++) {
-         char *busid = xf86_platform_odev_attributes(i)->busid;
-
--        if (pci && (strncmp(busid, "pci:", 4) == 0)) {
-+        if (pci && busid && (strncmp(busid, "pci:", 4) == 0)) {
-             platform_find_pci_info(&xf86_platform_devices[i], busid);
-         }
-
---
-2.24.1
-
diff --git a/package/x11r7/xserver_xorg-server/0006-compiler.h-don-t-define-inb-outb-and-friends-on-mips.patch b/package/x11r7/xserver_xorg-server/0006-compiler.h-don-t-define-inb-outb-and-friends-on-mips.patch
deleted file mode 100644
index 469ca7e3fc..0000000000
--- a/package/x11r7/xserver_xorg-server/0006-compiler.h-don-t-define-inb-outb-and-friends-on-mips.patch
+++ /dev/null
@@ -1,73 +0,0 @@
-From de5e24b5036a1a5a877f8f30169e3497d0e296d6 Mon Sep 17 00:00:00 2001
-From: Julien Cristau <jcristau@debian.org>
-Date: Wed, 6 Jan 2021 10:20:53 +0100
-Subject: [PATCH] compiler.h: don't define inb/outb and friends on mips
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-The definition relies on IOPortBase, which is only ever set in
-hw/xfree86/os-support/bsd/arm_video.c
-
-This caused build failures on linux/mips with GCC 10, due to this
-change (from https://gcc.gnu.org/gcc-10/changes.html#c):
-
-"GCC now defaults to -fno-common. As a result, global variable accesses
-are more efficient on various targets. In C, global variables with
-multiple tentative definitions now result in linker errors. With
--fcommon such definitions are silently merged during linking."
-
-As a result anything including compiler.h would get its own definition
-of IOPortBase and the linker would error out.
-
-Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
----
- hw/xfree86/common/compiler.h          | 8 ++------
- hw/xfree86/os-support/bsd/arm_video.c | 3 +++
- 2 files changed, 5 insertions(+), 6 deletions(-)
-
-diff --git a/hw/xfree86/common/compiler.h b/hw/xfree86/common/compiler.h
-index 2b2008b3f..eb788d3fd 100644
---- a/hw/xfree86/common/compiler.h
-+++ b/hw/xfree86/common/compiler.h
-@@ -518,14 +518,10 @@ xf86WriteMmio32Le(__volatile__ void *base, const unsigned long offset,
-     barrier();
- }
- 
--#elif defined(__mips__) || (defined(__arm32__) && !defined(__linux__))
--#if defined(__arm32__) || defined(__mips64)
-+#elif defined(__arm32__) && !defined(__linux__)
- #define PORT_SIZE long
--#else
--#define PORT_SIZE short
--#endif
- 
--_X_EXPORT unsigned int IOPortBase;      /* Memory mapped I/O port area */
-+extern _X_EXPORT unsigned int IOPortBase;      /* Memory mapped I/O port area */
- 
- static __inline__ void
- outb(unsigned PORT_SIZE port, unsigned char val)
-diff --git a/hw/xfree86/os-support/bsd/arm_video.c b/hw/xfree86/os-support/bsd/arm_video.c
-index dd1020e33..180d70543 100644
---- a/hw/xfree86/os-support/bsd/arm_video.c
-+++ b/hw/xfree86/os-support/bsd/arm_video.c
-@@ -65,6 +65,7 @@
- #include "xf86Priv.h"
- #include "xf86_OSlib.h"
- #include "xf86OSpriv.h"
-+#include "compiler.h"
- 
- #if defined(__NetBSD__) && !defined(MAP_FILE)
- #define MAP_FLAGS MAP_SHARED
-@@ -162,6 +163,8 @@ xf86DisableIO()
- 
- #if defined(USE_ARC_MMAP) || defined(__arm32__)
- 
-+unsigned int IOPortBase;
-+
- Bool
- xf86EnableIO()
- {
--- 
-2.32.0
-
diff --git a/package/x11r7/xserver_xorg-server/Config.in b/package/x11r7/xserver_xorg-server/Config.in
index 7f37f2f1ac..4fb03051dd 100644
--- a/package/x11r7/xserver_xorg-server/Config.in
+++ b/package/x11r7/xserver_xorg-server/Config.in
@@ -18,6 +18,7 @@ config BR2_PACKAGE_XSERVER_XORG_SERVER
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXAU
 	select BR2_PACKAGE_XLIB_LIBXCURSOR
+	select BR2_PACKAGE_XLIB_LIBXCVT
 	select BR2_PACKAGE_XLIB_LIBXDAMAGE
 	select BR2_PACKAGE_XLIB_LIBXDMCP
 	select BR2_PACKAGE_XLIB_LIBXEXT
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash b/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
index 8eb56ba027..d389e6713a 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
@@ -1,6 +1,6 @@
-# From https://lists.x.org/archives/xorg-announce/2021-July/003100.html
-sha256  40aa4e96a56a81a301f15a9b10e06a22700f12b42d9e0e453c7f11d354386300  xorg-server-1.20.13.tar.xz
-sha512  4e0b7bd4e070dc52cb2c51c2056feb133de2c0487d359392ed63abba9702910cd2e2983e9415973d8d6e9672eac78be6f39202687fc56610877914ce722554b3  xorg-server-1.20.13.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2021-November/003116.html
+sha256  782e7fef2ca0c7cbe60a937b8bf42dac69c904fb841950fd0363e1c2346ea755  xorg-server-21.1.1.tar.xz
+sha512  8608ed9c1537c95e8a3adea5e3e372a3c5eb841f8e27c84283093f22fb1909e16a800006510da684b13f8f237f33b8a4be3e2537f5f9ab9af4c5ad12770eef0d  xorg-server-21.1.1.tar.xz
 
 # Locally calculated
 sha256  4cc0447a22635c7b2f1a93fec4aa94f1970fadeb72a063de006b51cf4963a06f  COPYING
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index 6d0876f1fd..bedf05c8fa 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -4,17 +4,14 @@
 #
 ################################################################################
 
-XSERVER_XORG_SERVER_VERSION = 1.20.13
+XSERVER_XORG_SERVER_VERSION = 21.1.1
 XSERVER_XORG_SERVER_SOURCE = xorg-server-$(XSERVER_XORG_SERVER_VERSION).tar.xz
 XSERVER_XORG_SERVER_SITE = https://xorg.freedesktop.org/archive/individual/xserver
 XSERVER_XORG_SERVER_LICENSE = MIT
 XSERVER_XORG_SERVER_LICENSE_FILES = COPYING
 XSERVER_XORG_SERVER_SELINUX_MODULES = xserver
 XSERVER_XORG_SERVER_INSTALL_STAGING = YES
-# xfont_font-util is needed only for autoreconf
-XSERVER_XORG_SERVER_AUTORECONF = YES
 XSERVER_XORG_SERVER_DEPENDENCIES = \
-	xfont_font-util \
 	xutil_util-macros \
 	xlib_libX11 \
 	xlib_libXau \
@@ -32,6 +29,7 @@ XSERVER_XORG_SERVER_DEPENDENCIES = \
 	xlib_libXdamage \
 	xlib_libXxf86vm \
 	xlib_libxkbfile \
+	xlib_libxcvt \
 	xlib_xtrans \
 	xdata_xbitmaps \
 	xorgproto \
@@ -67,14 +65,6 @@ XSERVER_XORG_SERVER_CONF_OPTS += \
 	--disable-systemd-logind
 endif
 
-# Xwayland support needs libdrm, libepoxy, wayland and libxcomposite
-ifeq ($(BR2_PACKAGE_LIBDRM)$(BR2_PACKAGE_LIBEPOXY)$(BR2_PACKAGE_WAYLAND)$(BR2_PACKAGE_WAYLAND_PROTOCOLS)$(BR2_PACKAGE_XLIB_LIBXCOMPOSITE),yyyyy)
-XSERVER_XORG_SERVER_CONF_OPTS += --enable-xwayland
-XSERVER_XORG_SERVER_DEPENDENCIES += libdrm libepoxy wayland wayland-protocols xlib_libXcomposite
-else
-XSERVER_XORG_SERVER_CONF_OPTS += --disable-xwayland
-endif
-
 ifeq ($(BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR),y)
 XSERVER_XORG_SERVER_CONF_OPTS += --enable-xorg
 XSERVER_XORG_SERVER_DEPENDENCIES += libpciaccess

--===============8352737878482947284==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8352737878482947284==--
