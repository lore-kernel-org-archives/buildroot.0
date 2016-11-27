From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 27 Nov 2016 22:31:15 +0100
Subject: [Buildroot] [git commit branch/next]
	package/x11r7/xdriver_xf86-input-mouse: bump version to 1.9.2
Message-ID: <20161127213919.2AC9981908@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8e5380db9ed0e92c60bc29a624a30bb1f0ef0e19
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xdriver_xf86-input-mouse/xdriver_xf86-input-mouse.hash | 4 ++--
 package/x11r7/xdriver_xf86-input-mouse/xdriver_xf86-input-mouse.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-input-mouse/xdriver_xf86-input-mouse.hash b/package/x11r7/xdriver_xf86-input-mouse/xdriver_xf86-input-mouse.hash
index 5a62d13..caba427 100644
--- a/package/x11r7/xdriver_xf86-input-mouse/xdriver_xf86-input-mouse.hash
+++ b/package/x11r7/xdriver_xf86-input-mouse/xdriver_xf86-input-mouse.hash
@@ -1,2 +1,2 @@
-# From http://lists.x.org/archives/xorg-announce/2014-August/002471.html
-sha256	3485d375779c08406f0789feedde15933dc703158a086ddac638598f479fc5ce	xf86-input-mouse-1.9.1.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2016-November/002740.html
+sha256 f425d5b05c6ab412a27e0a1106bb83f9e2662b307210abbe48270892387f4b2f  xf86-input-mouse-1.9.2.tar.bz2
diff --git a/package/x11r7/xdriver_xf86-input-mouse/xdriver_xf86-input-mouse.mk b/package/x11r7/xdriver_xf86-input-mouse/xdriver_xf86-input-mouse.mk
index e1bd81a..5bcbeb7 100644
--- a/package/x11r7/xdriver_xf86-input-mouse/xdriver_xf86-input-mouse.mk
+++ b/package/x11r7/xdriver_xf86-input-mouse/xdriver_xf86-input-mouse.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_INPUT_MOUSE_VERSION = 1.9.1
+XDRIVER_XF86_INPUT_MOUSE_VERSION = 1.9.2
 XDRIVER_XF86_INPUT_MOUSE_SOURCE = xf86-input-mouse-$(XDRIVER_XF86_INPUT_MOUSE_VERSION).tar.bz2
 XDRIVER_XF86_INPUT_MOUSE_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_INPUT_MOUSE_LICENSE = MIT
