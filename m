From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  3 Oct 2015 23:19:57 +0200
Subject: [Buildroot] [PATCH 3/4] package/x11r7/libxcb: bump version to 1.11.1
In-Reply-To: <1443907198-6833-1-git-send-email-bernd.kuhls@t-online.de>
References: <1443907198-6833-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1443907198-6833-3-git-send-email-bernd.kuhls@t-online.de>
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
index e938a5a..62060ee 100644
--- a/package/x11r7/libxcb/libxcb.hash
+++ b/package/x11r7/libxcb/libxcb.hash
@@ -1,2 +1,2 @@
-# From http://lists.freedesktop.org/pipermail/xorg/2014-August/056793.html
-sha256	03635d70045b9ede90778e67516135828a57de87ac508f987024f43c03620ff7	libxcb-1.11.tar.bz2
+# From http://lists.x.org/archives/xorg-announce/2015-September/002633.html
+sha256	b720fd6c7d200e5371affdb3f049cc8f88cff9aed942ff1b824d95eedbf69d30	libxcb-1.11.1.tar.bz2
diff --git a/package/x11r7/libxcb/libxcb.mk b/package/x11r7/libxcb/libxcb.mk
index f4a3aa9..c46ee26 100644
--- a/package/x11r7/libxcb/libxcb.mk
+++ b/package/x11r7/libxcb/libxcb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBXCB_VERSION = 1.11
+LIBXCB_VERSION = 1.11.1
 LIBXCB_SOURCE = libxcb-$(LIBXCB_VERSION).tar.bz2
 LIBXCB_SITE = http://xcb.freedesktop.org/dist
 LIBXCB_LICENSE = MIT
-- 
2.5.3
