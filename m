From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 6 Oct 2017 12:31:54 +0200
Subject: [Buildroot] [git commit] package/x11r7/xkeyboard-config: bump
	version to 2.22
Message-ID: <20171006103405.67DB680FC8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=12227adbb7ce13b2f938618ec48d3088d9932720
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/xkeyboard-config/xkeyboard-config.hash | 8 ++++----
 package/x11r7/xkeyboard-config/xkeyboard-config.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xkeyboard-config/xkeyboard-config.hash b/package/x11r7/xkeyboard-config/xkeyboard-config.hash
index 0f251b0..a0f781d 100644
--- a/package/x11r7/xkeyboard-config/xkeyboard-config.hash
+++ b/package/x11r7/xkeyboard-config/xkeyboard-config.hash
@@ -1,4 +1,4 @@
-# From https://lists.x.org/archives/xorg-announce/2017-May/002800.html
-md5 af9498e8954907d0a47f0f7b3d21e1ef  xkeyboard-config-2.21.tar.bz2
-sha1 ccdc53ad0ff6bbabda19ef30a47c2cbe014d42ec  xkeyboard-config-2.21.tar.bz2
-sha256 30c17049fae129fc14875656da9aa3099e3031d6ce0ee1d77aae190fd9edcec5  xkeyboard-config-2.21.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2017-October/002811.html
+md5 eb61fb3fd419e817df572b0c8d94a883  xkeyboard-config-2.22.tar.bz2
+sha1 1e252098685afc3e802c98f3fd70d683654a13ab  xkeyboard-config-2.22.tar.bz2
+sha256 deaec9989fbc443358b43864437b7b6d39caff07890a4a8055105ce9fcaa59bd  xkeyboard-config-2.22.tar.bz2
diff --git a/package/x11r7/xkeyboard-config/xkeyboard-config.mk b/package/x11r7/xkeyboard-config/xkeyboard-config.mk
index e8c1d23..ae88db7 100644
--- a/package/x11r7/xkeyboard-config/xkeyboard-config.mk
+++ b/package/x11r7/xkeyboard-config/xkeyboard-config.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XKEYBOARD_CONFIG_VERSION = 2.21
+XKEYBOARD_CONFIG_VERSION = 2.22
 XKEYBOARD_CONFIG_SOURCE = xkeyboard-config-$(XKEYBOARD_CONFIG_VERSION).tar.bz2
 XKEYBOARD_CONFIG_SITE = http://www.x.org/releases/individual/data/xkeyboard-config
 XKEYBOARD_CONFIG_LICENSE = MIT
