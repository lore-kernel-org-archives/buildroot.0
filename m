From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Jun 2016 16:42:45 +0200
Subject: [Buildroot] [git commit] package/x11r7/xkeyboard-config: bump
	version to 2.18
Message-ID: <20160611144303.3D17581D65@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d6ca79df92b27ec91504b1d178513b8f7b5362d4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xkeyboard-config/xkeyboard-config.hash | 4 ++--
 package/x11r7/xkeyboard-config/xkeyboard-config.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xkeyboard-config/xkeyboard-config.hash b/package/x11r7/xkeyboard-config/xkeyboard-config.hash
index fad76ed..7c2b64d 100644
--- a/package/x11r7/xkeyboard-config/xkeyboard-config.hash
+++ b/package/x11r7/xkeyboard-config/xkeyboard-config.hash
@@ -1,2 +1,2 @@
-# From http://lists.x.org/archives/xorg-announce/2016-January/002671.html
-sha256	dec6be44bd31775cdc1ab95bfd75d5f2c0055613eeca8b4e9c6480b183430701	xkeyboard-config-2.17.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2016-June/002698.html
+sha256	c41d917d6c8a59feb7ccbda51c40a6ada824fdd1e9684b52dd48c9530617ddd0	xkeyboard-config-2.18.tar.bz2
diff --git a/package/x11r7/xkeyboard-config/xkeyboard-config.mk b/package/x11r7/xkeyboard-config/xkeyboard-config.mk
index 352c55d..e96d1d7 100644
--- a/package/x11r7/xkeyboard-config/xkeyboard-config.mk
+++ b/package/x11r7/xkeyboard-config/xkeyboard-config.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XKEYBOARD_CONFIG_VERSION = 2.17
+XKEYBOARD_CONFIG_VERSION = 2.18
 XKEYBOARD_CONFIG_SOURCE = xkeyboard-config-$(XKEYBOARD_CONFIG_VERSION).tar.bz2
 XKEYBOARD_CONFIG_SITE = http://www.x.org/releases/individual/data/xkeyboard-config
 XKEYBOARD_CONFIG_LICENSE = MIT
