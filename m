From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Mar 2014 23:17:04 +0100
Subject: [Buildroot] [git commit] xapp_xset: Bump version to 1.2.3
Message-ID: <20140329222159.262B99C42C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a765c61b62ef4872361ba4bbae0dd815d06f4e5e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xapp_xset/xapp_xset.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xapp_xset/xapp_xset.mk b/package/x11r7/xapp_xset/xapp_xset.mk
index 9a37588..157cd22 100644
--- a/package/x11r7/xapp_xset/xapp_xset.mk
+++ b/package/x11r7/xapp_xset/xapp_xset.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XSET_VERSION = 1.2.2
+XAPP_XSET_VERSION = 1.2.3
 XAPP_XSET_SOURCE = xset-$(XAPP_XSET_VERSION).tar.bz2
 XAPP_XSET_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XSET_LICENSE = MIT
