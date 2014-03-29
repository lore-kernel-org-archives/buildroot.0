From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Mar 2014 23:19:24 +0100
Subject: [Buildroot] [git commit] xapp_xstdcmap: Bump version to 1.0.3
Message-ID: <20140329222159.92DF29C41F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=39937c6687dfbfd4db54f53529845e2b5bd999cf
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xapp_xstdcmap/xapp_xstdcmap.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xapp_xstdcmap/xapp_xstdcmap.mk b/package/x11r7/xapp_xstdcmap/xapp_xstdcmap.mk
index 8a21080..a4d6dc3 100644
--- a/package/x11r7/xapp_xstdcmap/xapp_xstdcmap.mk
+++ b/package/x11r7/xapp_xstdcmap/xapp_xstdcmap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XSTDCMAP_VERSION = 1.0.1
+XAPP_XSTDCMAP_VERSION = 1.0.3
 XAPP_XSTDCMAP_SOURCE = xstdcmap-$(XAPP_XSTDCMAP_VERSION).tar.bz2
 XAPP_XSTDCMAP_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XSTDCMAP_LICENSE = MIT
