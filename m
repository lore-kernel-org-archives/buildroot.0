From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  2 May 2015 10:17:43 +0200
Subject: [Buildroot] [PATCH 09/10] package/libpciaccess: bump version to
	0.13.4
In-Reply-To: <1430554664-19320-1-git-send-email-bernd.kuhls@t-online.de>
References: <1430554664-19320-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1430554664-19320-9-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libpciaccess/libpciaccess.hash |    4 ++--
 package/libpciaccess/libpciaccess.mk   |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libpciaccess/libpciaccess.hash b/package/libpciaccess/libpciaccess.hash
index 10efd1c..0483c4c 100644
--- a/package/libpciaccess/libpciaccess.hash
+++ b/package/libpciaccess/libpciaccess.hash
@@ -1,2 +1,2 @@
-# From http://lists.x.org/archives/xorg-announce/2015-February/002528.html
-sha256	6cd76ccae4e06eee47d3ead84a118740e9406e2a9b7adc9b08e92c69ce89c2e3	libpciaccess-0.13.3.tar.bz2
+# From http://lists.x.org/archives/xorg-announce/2015-April/002590.html
+sha256	07f864654561e4ac8629a0ef9c8f07fbc1f8592d1b6c418431593e9ba2cf2fcf	libpciaccess-0.13.4.tar.bz2
diff --git a/package/libpciaccess/libpciaccess.mk b/package/libpciaccess/libpciaccess.mk
index ade4cc6..ced0786 100644
--- a/package/libpciaccess/libpciaccess.mk
+++ b/package/libpciaccess/libpciaccess.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPCIACCESS_VERSION = 0.13.3
+LIBPCIACCESS_VERSION = 0.13.4
 LIBPCIACCESS_SOURCE = libpciaccess-$(LIBPCIACCESS_VERSION).tar.bz2
 LIBPCIACCESS_SITE = http://xorg.freedesktop.org/releases/individual/lib
 LIBPCIACCESS_LICENSE = MIT
-- 
1.7.10.4
