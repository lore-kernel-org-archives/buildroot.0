From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 20 Jul 2012 20:05:24 +0200
Subject: [Buildroot] [git commit branch/next] dfu-util: cosmetic fix
Message-ID: <20120802195257.24A128D2C5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1677d40822f032fc09ab271a3d14eb6f445cc91b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/dfu-util/dfu-util.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/dfu-util/dfu-util.mk b/package/dfu-util/dfu-util.mk
index 4ba7014..77470fa 100644
--- a/package/dfu-util/dfu-util.mk
+++ b/package/dfu-util/dfu-util.mk
@@ -3,7 +3,7 @@
 # dfu-util
 #
 #############################################################
-DFU_UTIL_VERSION:=0.6
+DFU_UTIL_VERSION = 0.6
 DFU_UTIL_SOURCE = dfu-util-$(DFU_UTIL_VERSION).tar.gz
 DFU_UTIL_SITE = http://dfu-util.gnumonks.org/releases/
 
