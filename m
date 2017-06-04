From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 4 Jun 2017 09:53:24 +0200
Subject: [Buildroot] [git commit] package/x11r7/xkeyboard-config: bump
	version to 2.21
Message-ID: <20170604075331.0DD31821D9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=47229e8afe068dc1ae382813f2e32b9cd3eb816d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Added all hashes provided by upstream.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xkeyboard-config/xkeyboard-config.hash | 6 ++++--
 package/x11r7/xkeyboard-config/xkeyboard-config.mk   | 2 +-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xkeyboard-config/xkeyboard-config.hash b/package/x11r7/xkeyboard-config/xkeyboard-config.hash
index 104a5ab..0f251b0 100644
--- a/package/x11r7/xkeyboard-config/xkeyboard-config.hash
+++ b/package/x11r7/xkeyboard-config/xkeyboard-config.hash
@@ -1,2 +1,4 @@
-# From https://lists.x.org/archives/xorg-announce/2017-February/002775.html
-sha256 d1bfc72553c4e3ef1cd6f13eec0488cf940498b612ab8a0b362e7090c94bc134  xkeyboard-config-2.20.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2017-May/002800.html
+md5 af9498e8954907d0a47f0f7b3d21e1ef  xkeyboard-config-2.21.tar.bz2
+sha1 ccdc53ad0ff6bbabda19ef30a47c2cbe014d42ec  xkeyboard-config-2.21.tar.bz2
+sha256 30c17049fae129fc14875656da9aa3099e3031d6ce0ee1d77aae190fd9edcec5  xkeyboard-config-2.21.tar.bz2
diff --git a/package/x11r7/xkeyboard-config/xkeyboard-config.mk b/package/x11r7/xkeyboard-config/xkeyboard-config.mk
index bdaf026..e8c1d23 100644
--- a/package/x11r7/xkeyboard-config/xkeyboard-config.mk
+++ b/package/x11r7/xkeyboard-config/xkeyboard-config.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XKEYBOARD_CONFIG_VERSION = 2.20
+XKEYBOARD_CONFIG_VERSION = 2.21
 XKEYBOARD_CONFIG_SOURCE = xkeyboard-config-$(XKEYBOARD_CONFIG_VERSION).tar.bz2
 XKEYBOARD_CONFIG_SITE = http://www.x.org/releases/individual/data/xkeyboard-config
 XKEYBOARD_CONFIG_LICENSE = MIT
