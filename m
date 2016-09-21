From: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
Date: Wed, 21 Sep 2016 17:00:10 -0400
Subject: [Buildroot] [PATCH] genimage: bump to version 9
Message-ID: <20160921210010.13278-1-vivien.didelot@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
---
 package/genimage/genimage.hash | 2 +-
 package/genimage/genimage.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/genimage/genimage.hash b/package/genimage/genimage.hash
index b01ea46..4be2fca 100644
--- a/package/genimage/genimage.hash
+++ b/package/genimage/genimage.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	363b2222b8036eca927c464994e7a877539adc3ea9ba895c1e2186f0589fafbf	genimage-8.tar.xz
+sha256	69f35af7edf6f4dbdac7a18ddc69dcf38c501e43d8b50c524555754c51479078	genimage-9.tar.xz
diff --git a/package/genimage/genimage.mk b/package/genimage/genimage.mk
index 489e8d0..69d0c08 100644
--- a/package/genimage/genimage.mk
+++ b/package/genimage/genimage.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GENIMAGE_VERSION = 8
+GENIMAGE_VERSION = 9
 GENIMAGE_SOURCE = genimage-$(GENIMAGE_VERSION).tar.xz
 GENIMAGE_SITE = http://www.pengutronix.de/software/genimage/download
 HOST_GENIMAGE_DEPENDENCIES = host-pkgconf host-libconfuse
-- 
2.10.0
