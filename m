From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 14 Sep 2017 16:07:52 +0200
Subject: [Buildroot] [PATCH 1/1] package/ofono: bump version to 1.20
Message-ID: <20170914140752.7520-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/ofono/ofono.hash | 2 +-
 package/ofono/ofono.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ofono/ofono.hash b/package/ofono/ofono.hash
index d61173684d..ef955a9bb8 100644
--- a/package/ofono/ofono.hash
+++ b/package/ofono/ofono.hash
@@ -1,2 +1,2 @@
 # From https://www.kernel.org/pub/linux/network/ofono/sha256sums.asc
-sha256	53cdbf342913f46bce4827241c60e24255a3d43a94945edf77482ae5b312d51f  ofono-1.18.tar.xz
+sha256 5d7ba8f481a7715d013a79f8d6477eb89d8aaae399395d5d008a1317c34a31d5  ofono-1.20.tar.xz
diff --git a/package/ofono/ofono.mk b/package/ofono/ofono.mk
index 88749aaf00..1aea2d40ae 100644
--- a/package/ofono/ofono.mk
+++ b/package/ofono/ofono.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OFONO_VERSION = 1.18
+OFONO_VERSION = 1.20
 OFONO_SOURCE = ofono-$(OFONO_VERSION).tar.xz
 OFONO_SITE = $(BR2_KERNEL_MIRROR)/linux/network/ofono
 OFONO_LICENSE = GPL-2.0
-- 
2.11.0
