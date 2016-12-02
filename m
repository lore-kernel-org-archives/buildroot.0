From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri,  2 Dec 2016 14:42:04 -0300
Subject: [Buildroot] [PATCH] libxkbcommon: bump to version 0.7.0
Message-ID: <1480700524-1220-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libxkbcommon/libxkbcommon.hash | 4 ++--
 package/libxkbcommon/libxkbcommon.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libxkbcommon/libxkbcommon.hash b/package/libxkbcommon/libxkbcommon.hash
index 693630a..2677099 100644
--- a/package/libxkbcommon/libxkbcommon.hash
+++ b/package/libxkbcommon/libxkbcommon.hash
@@ -1,2 +1,2 @@
-# From https://lists.freedesktop.org/archives/wayland-devel/2016-April/027962.html
-sha256	5b0887b080b42169096a61106661f8d35bae783f8b6c58f97ebcd3af83ea8760	libxkbcommon-0.6.1.tar.xz
+# From https://lists.freedesktop.org/archives/wayland-devel/2016-November/031544.html
+sha256	09351592312d67b438655f54da5b67853026662c4a57e6be4d225f04a9989798	libxkbcommon-0.7.0.tar.xz
diff --git a/package/libxkbcommon/libxkbcommon.mk b/package/libxkbcommon/libxkbcommon.mk
index 1f80348..3a0600b 100644
--- a/package/libxkbcommon/libxkbcommon.mk
+++ b/package/libxkbcommon/libxkbcommon.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBXKBCOMMON_VERSION = 0.6.1
+LIBXKBCOMMON_VERSION = 0.7.0
 LIBXKBCOMMON_SITE = http://xkbcommon.org/download
 LIBXKBCOMMON_SOURCE = libxkbcommon-$(LIBXKBCOMMON_VERSION).tar.xz
 LIBXKBCOMMON_LICENSE = MIT/X11
-- 
2.7.3
