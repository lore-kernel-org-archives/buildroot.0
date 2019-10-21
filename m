From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 21 Oct 2019 19:21:20 +0200
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xkeyboard-config: bump
 version to 2.28
Message-ID: <20191021172120.10972-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changelog: https://cgit.freedesktop.org/xkeyboard-config/log/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xkeyboard-config/xkeyboard-config.hash | 2 +-
 package/x11r7/xkeyboard-config/xkeyboard-config.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xkeyboard-config/xkeyboard-config.hash b/package/x11r7/xkeyboard-config/xkeyboard-config.hash
index 55a9b28f16..ae94bb490a 100644
--- a/package/x11r7/xkeyboard-config/xkeyboard-config.hash
+++ b/package/x11r7/xkeyboard-config/xkeyboard-config.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 690daec8fea63526c07620c90e6f3f10aae34e94b6db6e30906173480721901f  xkeyboard-config-2.27.tar.bz2
+sha256 69adb25b0fc64e4075f8ec0eab8d869892419f474f91fb69db1713de2062bdce  xkeyboard-config-2.28.tar.bz2
 sha256 6ca90f4b67dced4062894d6d77f4cc39343df9e359fc12f5e5d3c89ef2a3ef6d  COPYING
diff --git a/package/x11r7/xkeyboard-config/xkeyboard-config.mk b/package/x11r7/xkeyboard-config/xkeyboard-config.mk
index d1b9586588..d8e2434235 100644
--- a/package/x11r7/xkeyboard-config/xkeyboard-config.mk
+++ b/package/x11r7/xkeyboard-config/xkeyboard-config.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XKEYBOARD_CONFIG_VERSION = 2.27
+XKEYBOARD_CONFIG_VERSION = 2.28
 XKEYBOARD_CONFIG_SOURCE = xkeyboard-config-$(XKEYBOARD_CONFIG_VERSION).tar.bz2
 XKEYBOARD_CONFIG_SITE = http://www.x.org/releases/individual/data/xkeyboard-config
 XKEYBOARD_CONFIG_LICENSE = MIT
-- 
2.20.1
