From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed,  7 Mar 2018 21:58:27 +0100
Subject: [Buildroot] [PATCH 02/19] package/x11r7/libxcb: bump version to 1.13
In-Reply-To: <20180307205844.3240-1-bernd.kuhls@t-online.de>
References: <20180307205844.3240-1-bernd.kuhls@t-online.de>
Message-ID: <20180307205844.3240-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Added all upstream hashes and license hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/libxcb/libxcb.hash | 9 +++++++--
 package/x11r7/libxcb/libxcb.mk   | 2 +-
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/libxcb/libxcb.hash b/package/x11r7/libxcb/libxcb.hash
index 6df7d01792..d2b5da6b52 100644
--- a/package/x11r7/libxcb/libxcb.hash
+++ b/package/x11r7/libxcb/libxcb.hash
@@ -1,2 +1,7 @@
-# From https://lists.x.org/archives/xorg-announce/2016-May/002694.html
-sha256	4adfb1b7c67e99bc9c2ccb110b2f175686576d2f792c8a71b9c8b19014057b5b	libxcb-1.12.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2018-March/002851.html
+md5 c2b6cf928afa16b0047c974e7aaa783f  libxcb-1.13.tar.bz2
+sha1 212ad5f1f80def80536d78e3d20354a0370e7fe9  libxcb-1.13.tar.bz2
+sha256 188c8752193c50ff2dbe89db4554c63df2e26a2e47b0fa415a70918b5b851daa  libxcb-1.13.tar.bz2
+sha512 d99bbe386a65f60fcc0cc2935e4a365bc0577b5e90433e18778a665a5aee8ebc8e9e8cb0aedac0ac4a276147c0507e759a716874ea4f80792b2fc18eefbc128c  libxcb-1.13.tar.bz2
+# Locally computed
+sha256 c5ffbfeaa501071ceeb97b7de2c0d703fdaa35de01c0fb6cbac1c28453a3e9fd  COPYING
diff --git a/package/x11r7/libxcb/libxcb.mk b/package/x11r7/libxcb/libxcb.mk
index 32edbb9e90..7e467aca3f 100644
--- a/package/x11r7/libxcb/libxcb.mk
+++ b/package/x11r7/libxcb/libxcb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBXCB_VERSION = 1.12
+LIBXCB_VERSION = 1.13
 LIBXCB_SOURCE = libxcb-$(LIBXCB_VERSION).tar.bz2
 LIBXCB_SITE = http://xcb.freedesktop.org/dist
 LIBXCB_LICENSE = MIT
-- 
2.11.0
