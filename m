From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Mar 2014 23:19:41 +0100
Subject: [Buildroot] [git commit] xapp_xmag: Bump version to 1.0.5
Message-ID: <20140329222159.E0D599C41F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=da5f92891696ab34749e4e40ccb9e8486e5d98b4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xapp_xmag/xapp_xmag.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xapp_xmag/xapp_xmag.mk b/package/x11r7/xapp_xmag/xapp_xmag.mk
index bd98695..9851499 100644
--- a/package/x11r7/xapp_xmag/xapp_xmag.mk
+++ b/package/x11r7/xapp_xmag/xapp_xmag.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XMAG_VERSION = 1.0.4
+XAPP_XMAG_VERSION = 1.0.5
 XAPP_XMAG_SOURCE = xmag-$(XAPP_XMAG_VERSION).tar.bz2
 XAPP_XMAG_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XMAG_LICENSE = MIT
