From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 08 Aug 2015 10:56:37 -0000
Subject: [Buildroot] [git commit branch/next]
	package/x11r7/xdriver_xf86-input-vmmouse: bump version to 13.1.0
Message-ID: <20150808105636.908F67FB5A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5a22391227f9ff924c7d5107705c49206ca0ff5d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../xdriver_xf86-input-vmmouse.hash                |    4 ++--
 .../xdriver_xf86-input-vmmouse.mk                  |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-input-vmmouse/xdriver_xf86-input-vmmouse.hash b/package/x11r7/xdriver_xf86-input-vmmouse/xdriver_xf86-input-vmmouse.hash
index 5331fac..302b1cd 100644
--- a/package/x11r7/xdriver_xf86-input-vmmouse/xdriver_xf86-input-vmmouse.hash
+++ b/package/x11r7/xdriver_xf86-input-vmmouse/xdriver_xf86-input-vmmouse.hash
@@ -1,2 +1,2 @@
-# From http://lists.freedesktop.org/archives/xorg/2013-January/055275.html
-sha256	04cfb60366008d4db815c550d8fb8d0a4270c75fa7a20fa3bddc9ecbd355612c	xf86-input-vmmouse-13.0.0.tar.bz2
+# From http://lists.x.org/archives/xorg-announce/2015-June/002616.html
+sha256	0af558957ac1be1b2863712c2475de8f4d7f14921fd01ded2e2fde4921b19319	xf86-input-vmmouse-13.1.0.tar.bz2
diff --git a/package/x11r7/xdriver_xf86-input-vmmouse/xdriver_xf86-input-vmmouse.mk b/package/x11r7/xdriver_xf86-input-vmmouse/xdriver_xf86-input-vmmouse.mk
index d982d82..53ceec8 100644
--- a/package/x11r7/xdriver_xf86-input-vmmouse/xdriver_xf86-input-vmmouse.mk
+++ b/package/x11r7/xdriver_xf86-input-vmmouse/xdriver_xf86-input-vmmouse.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_INPUT_VMMOUSE_VERSION = 13.0.0
+XDRIVER_XF86_INPUT_VMMOUSE_VERSION = 13.1.0
 XDRIVER_XF86_INPUT_VMMOUSE_SOURCE = xf86-input-vmmouse-$(XDRIVER_XF86_INPUT_VMMOUSE_VERSION).tar.bz2
 XDRIVER_XF86_INPUT_VMMOUSE_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_INPUT_VMMOUSE_LICENSE = MIT
