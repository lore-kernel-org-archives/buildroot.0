From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 28 Apr 2016 15:47:57 -0300
Subject: [Buildroot] [PATCH] libxkbcommon: bump to version 0.6.0
Message-ID: <1461869277-1738-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Unfortunately COPYING is gone so remove it.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libxkbcommon/libxkbcommon.hash | 5 ++---
 package/libxkbcommon/libxkbcommon.mk   | 4 +---
 2 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/package/libxkbcommon/libxkbcommon.hash b/package/libxkbcommon/libxkbcommon.hash
index 9cbe440..0264917 100644
--- a/package/libxkbcommon/libxkbcommon.hash
+++ b/package/libxkbcommon/libxkbcommon.hash
@@ -1,3 +1,2 @@
-# From http://lists.freedesktop.org/archives/wayland-devel/2014-October/017836.html
-md5	2e1faeafcc609c30af3a561a91e84158	libxkbcommon-0.5.0.tar.xz
-sha1	7127993bfb69e13cdff25fb8b3c8f26ce6be5bfa	libxkbcommon-0.5.0.tar.xz
+# From https://lists.freedesktop.org/archives/wayland-devel/2016-March/027483.html
+sha256	69235ec3a13194dea9555d7994bc4548b3ee20070e05a135af5372a958149ef0	libxkbcommon-0.6.0.tar.xz
diff --git a/package/libxkbcommon/libxkbcommon.mk b/package/libxkbcommon/libxkbcommon.mk
index 12d5f16..fec8089 100644
--- a/package/libxkbcommon/libxkbcommon.mk
+++ b/package/libxkbcommon/libxkbcommon.mk
@@ -4,12 +4,10 @@
 #
 ################################################################################
 
-LIBXKBCOMMON_VERSION = 0.5.0
+LIBXKBCOMMON_VERSION = 0.6.0
 LIBXKBCOMMON_SITE = http://xkbcommon.org/download
 LIBXKBCOMMON_SOURCE = libxkbcommon-$(LIBXKBCOMMON_VERSION).tar.xz
 LIBXKBCOMMON_LICENSE = MIT/X11
-LIBXKBCOMMON_LICENSE_FILES = COPYING
-
 LIBXKBCOMMON_INSTALL_STAGING = YES
 LIBXKBCOMMON_DEPENDENCIES = host-bison host-flex
 # uses C99 features
-- 
2.7.3
