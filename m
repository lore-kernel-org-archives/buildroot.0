From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 2 Dec 2016 20:35:44 +0100
Subject: [Buildroot] [git commit] libxkbcommon: bump to version 0.7.0
Message-ID: <20161202194633.4DE8E8183C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ed9924e4f434b01d20e0f4985671d47f73d6c92f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
