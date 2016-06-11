From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 11 Jun 2016 10:37:27 +0200
Subject: [Buildroot] [PATCH 4/9] package/x11r7/libxcb: bump version to 1.12
In-Reply-To: <1465634252-30741-1-git-send-email-bernd.kuhls@t-online.de>
References: <1465634252-30741-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1465634252-30741-4-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/libxcb/libxcb.hash | 4 ++--
 package/x11r7/libxcb/libxcb.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/libxcb/libxcb.hash b/package/x11r7/libxcb/libxcb.hash
index 62060ee..6df7d01 100644
--- a/package/x11r7/libxcb/libxcb.hash
+++ b/package/x11r7/libxcb/libxcb.hash
@@ -1,2 +1,2 @@
-# From http://lists.x.org/archives/xorg-announce/2015-September/002633.html
-sha256	b720fd6c7d200e5371affdb3f049cc8f88cff9aed942ff1b824d95eedbf69d30	libxcb-1.11.1.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2016-May/002694.html
+sha256	4adfb1b7c67e99bc9c2ccb110b2f175686576d2f792c8a71b9c8b19014057b5b	libxcb-1.12.tar.bz2
diff --git a/package/x11r7/libxcb/libxcb.mk b/package/x11r7/libxcb/libxcb.mk
index c46ee26..a740638 100644
--- a/package/x11r7/libxcb/libxcb.mk
+++ b/package/x11r7/libxcb/libxcb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBXCB_VERSION = 1.11.1
+LIBXCB_VERSION = 1.12
 LIBXCB_SOURCE = libxcb-$(LIBXCB_VERSION).tar.bz2
 LIBXCB_SITE = http://xcb.freedesktop.org/dist
 LIBXCB_LICENSE = MIT
-- 
2.8.1
