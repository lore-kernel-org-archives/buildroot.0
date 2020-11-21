From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 21 Nov 2020 13:20:14 +0100
Subject: [Buildroot] [PATCH/next 5/5] package/x11r7/xkeyboard-config: bump
 version to 2.31
In-Reply-To: <20201121122014.1508936-1-bernd.kuhls@t-online.de>
References: <20201121122014.1508936-1-bernd.kuhls@t-online.de>
Message-ID: <20201121122014.1508936-5-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xkeyboard-config/xkeyboard-config.hash | 2 +-
 package/x11r7/xkeyboard-config/xkeyboard-config.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xkeyboard-config/xkeyboard-config.hash b/package/x11r7/xkeyboard-config/xkeyboard-config.hash
index 4da866f7b5..3cbd191181 100644
--- a/package/x11r7/xkeyboard-config/xkeyboard-config.hash
+++ b/package/x11r7/xkeyboard-config/xkeyboard-config.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  095a524f7b633ed257617202d06c9c71fe020c8897b106cf0dcdd0c6e8b797d4  xkeyboard-config-2.30.tar.bz2
+sha256  da44181f2c8828789c720decf7d13acb3c3950e2a040af5132f50f04bb6aada3  xkeyboard-config-2.31.tar.bz2
 sha256  6ca90f4b67dced4062894d6d77f4cc39343df9e359fc12f5e5d3c89ef2a3ef6d  COPYING
diff --git a/package/x11r7/xkeyboard-config/xkeyboard-config.mk b/package/x11r7/xkeyboard-config/xkeyboard-config.mk
index 9cf1a57877..f192836d1a 100644
--- a/package/x11r7/xkeyboard-config/xkeyboard-config.mk
+++ b/package/x11r7/xkeyboard-config/xkeyboard-config.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XKEYBOARD_CONFIG_VERSION = 2.30
+XKEYBOARD_CONFIG_VERSION = 2.31
 XKEYBOARD_CONFIG_SOURCE = xkeyboard-config-$(XKEYBOARD_CONFIG_VERSION).tar.bz2
 XKEYBOARD_CONFIG_SITE = https://www.x.org/releases/individual/data/xkeyboard-config
 XKEYBOARD_CONFIG_LICENSE = MIT
-- 
2.27.0
