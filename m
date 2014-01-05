From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 5 Jan 2014 22:59:47 +0100
Subject: [Buildroot] [git commit] xorg: Bump xlib_xtrans version to 1.3.2
Message-ID: <20140105230943.00CE79C3D4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=76e0d9e2a2aa13d7b8a508a4792d82c7e4f0782b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/xlib_xtrans/xlib_xtrans.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xlib_xtrans/xlib_xtrans.mk b/package/x11r7/xlib_xtrans/xlib_xtrans.mk
index 9e02d21..8c5fd42 100644
--- a/package/x11r7/xlib_xtrans/xlib_xtrans.mk
+++ b/package/x11r7/xlib_xtrans/xlib_xtrans.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_XTRANS_VERSION = 1.2.7
+XLIB_XTRANS_VERSION = 1.3.2
 XLIB_XTRANS_SOURCE = xtrans-$(XLIB_XTRANS_VERSION).tar.bz2
 XLIB_XTRANS_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_XTRANS_LICENSE = MIT
