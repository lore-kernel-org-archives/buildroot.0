From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Mar 2014 23:19:22 +0100
Subject: [Buildroot] [git commit] xapp_xvinfo: Bump version to 1.1.2
Message-ID: <20140329222159.8CE759C41F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f0647faf2b9457c1e75d39113de4fa7475c6aa0d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xapp_xvinfo/xapp_xvinfo.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xapp_xvinfo/xapp_xvinfo.mk b/package/x11r7/xapp_xvinfo/xapp_xvinfo.mk
index 2db7840..0446ed3 100644
--- a/package/x11r7/xapp_xvinfo/xapp_xvinfo.mk
+++ b/package/x11r7/xapp_xvinfo/xapp_xvinfo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XVINFO_VERSION = 1.1.1
+XAPP_XVINFO_VERSION = 1.1.2
 XAPP_XVINFO_SOURCE = xvinfo-$(XAPP_XVINFO_VERSION).tar.bz2
 XAPP_XVINFO_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XVINFO_LICENSE = MIT
