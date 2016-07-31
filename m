From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 31 Jul 2016 11:17:40 +0200
Subject: [Buildroot] [PATCH 1/1] package/libvpx: bump version to 1.6.0
Message-ID: <1469956660-31806-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libvpx/libvpx.hash | 2 +-
 package/libvpx/libvpx.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libvpx/libvpx.hash b/package/libvpx/libvpx.hash
index 44cd994..fc4a751 100644
--- a/package/libvpx/libvpx.hash
+++ b/package/libvpx/libvpx.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256  f582d9b2d60a592a4a3d8c32965ca2d2167e9ade38c6c30bac8801ff66a118e4  libvpx-1.4.0.tar.bz2
+sha256  d0afbb5eb1ecae68f8d578abace160a97e2e8a230e3028cf4db115d59a695aad  libvpx-1.6.0.tar.bz2
diff --git a/package/libvpx/libvpx.mk b/package/libvpx/libvpx.mk
index 066b037..4ad5522 100644
--- a/package/libvpx/libvpx.mk
+++ b/package/libvpx/libvpx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBVPX_VERSION = 1.4.0
+LIBVPX_VERSION = 1.6.0
 LIBVPX_SOURCE = libvpx-$(LIBVPX_VERSION).tar.bz2
 LIBVPX_SITE = http://storage.googleapis.com/downloads.webmproject.org/releases/webm
 LIBVPX_LICENSE = BSD-3c
-- 
2.8.1
