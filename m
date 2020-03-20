From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 20 Mar 2020 21:54:54 +0100
Subject: [Buildroot] [git commit] package/x11r7/xkeyboard-config: bump
 version to 2.29
Message-ID: <20200320204154.DC0C282B2B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c09061bb5863ea9af9e44d6ab7f379f10d2720f4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Switch _SITE to https.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/xkeyboard-config/xkeyboard-config.hash | 2 +-
 package/x11r7/xkeyboard-config/xkeyboard-config.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xkeyboard-config/xkeyboard-config.hash b/package/x11r7/xkeyboard-config/xkeyboard-config.hash
index ae94bb490a..5066a46885 100644
--- a/package/x11r7/xkeyboard-config/xkeyboard-config.hash
+++ b/package/x11r7/xkeyboard-config/xkeyboard-config.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 69adb25b0fc64e4075f8ec0eab8d869892419f474f91fb69db1713de2062bdce  xkeyboard-config-2.28.tar.bz2
+sha256 1d4175278bf06000683656763a8b1d3282c61a314b6db41260c8efe92d621802  xkeyboard-config-2.29.tar.bz2
 sha256 6ca90f4b67dced4062894d6d77f4cc39343df9e359fc12f5e5d3c89ef2a3ef6d  COPYING
diff --git a/package/x11r7/xkeyboard-config/xkeyboard-config.mk b/package/x11r7/xkeyboard-config/xkeyboard-config.mk
index d8e2434235..fde5d058d8 100644
--- a/package/x11r7/xkeyboard-config/xkeyboard-config.mk
+++ b/package/x11r7/xkeyboard-config/xkeyboard-config.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XKEYBOARD_CONFIG_VERSION = 2.28
+XKEYBOARD_CONFIG_VERSION = 2.29
 XKEYBOARD_CONFIG_SOURCE = xkeyboard-config-$(XKEYBOARD_CONFIG_VERSION).tar.bz2
-XKEYBOARD_CONFIG_SITE = http://www.x.org/releases/individual/data/xkeyboard-config
+XKEYBOARD_CONFIG_SITE = https://www.x.org/releases/individual/data/xkeyboard-config
 XKEYBOARD_CONFIG_LICENSE = MIT
 XKEYBOARD_CONFIG_LICENSE_FILES = COPYING
 
