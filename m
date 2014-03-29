From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Mar 2014 23:17:11 +0100
Subject: [Buildroot] [git commit] xapp_xfd: Bump version to 1.1.2
Message-ID: <20140329222159.441A59C42C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=14363be7801ae0891201244099a7d89561260f3b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xapp_xfd/xapp_xfd.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xapp_xfd/xapp_xfd.mk b/package/x11r7/xapp_xfd/xapp_xfd.mk
index 5308a5c..e3c770b 100644
--- a/package/x11r7/xapp_xfd/xapp_xfd.mk
+++ b/package/x11r7/xapp_xfd/xapp_xfd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XFD_VERSION = 1.1.1
+XAPP_XFD_VERSION = 1.1.2
 XAPP_XFD_SOURCE = xfd-$(XAPP_XFD_VERSION).tar.bz2
 XAPP_XFD_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XFD_LICENSE = MIT
