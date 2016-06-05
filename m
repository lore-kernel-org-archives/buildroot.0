From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 5 Jun 2016 22:01:29 +0200
Subject: [Buildroot] [git commit] package/zyre: bump version
Message-ID: <20160605200530.D068481E84@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4fc6bf68d51428a9163137ef4a6ec7ce3a8b4d97
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/zyre/zyre.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/zyre/zyre.mk b/package/zyre/zyre.mk
index b17dfd0..41c11a8 100644
--- a/package/zyre/zyre.mk
+++ b/package/zyre/zyre.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZYRE_VERSION = a351468b7d313fc90c446668122365851a9c60e4
+ZYRE_VERSION = 1d949e4bf79b694ea883c325f5813e87ddc2a687
 ZYRE_SITE = $(call github,zeromq,zyre,$(ZYRE_VERSION))
 ZYRE_LICENSE = LGPLv3+
 ZYRE_LICENSE_FILES = COPYING COPYING.LESSER
