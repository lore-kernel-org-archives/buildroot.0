From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Mar 2014 23:19:39 +0100
Subject: [Buildroot] [git commit] xapp_xvidtune: Bump version to 1.0.3
Message-ID: <20140329222159.D55139C41F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=128390ec9e4b64d53581ee7c0d27ce51582f421e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xapp_xvidtune/xapp_xvidtune.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xapp_xvidtune/xapp_xvidtune.mk b/package/x11r7/xapp_xvidtune/xapp_xvidtune.mk
index 41c9dfe..d7c4d5b 100644
--- a/package/x11r7/xapp_xvidtune/xapp_xvidtune.mk
+++ b/package/x11r7/xapp_xvidtune/xapp_xvidtune.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XVIDTUNE_VERSION = 1.0.2
+XAPP_XVIDTUNE_VERSION = 1.0.3
 XAPP_XVIDTUNE_SOURCE = xvidtune-$(XAPP_XVIDTUNE_VERSION).tar.bz2
 XAPP_XVIDTUNE_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XVIDTUNE_LICENSE = MIT
