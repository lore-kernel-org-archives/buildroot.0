From: =?UTF-8?q?Beno=C3=AEt=20Th=C3=A9baudeau?= <benoit@wsystem.com>
Date: Thu, 24 Sep 2015 11:20:43 +0200
Subject: [Buildroot] [PATCH] package/genimage: bump version to 8
Message-ID: <1443086443-107037-1-git-send-email-benoit@wsystem.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This new version fixes segmentation faults on some platforms.

Signed-off-by: Beno?t Th?baudeau <benoit@wsystem.com>
---
 package/genimage/genimage.hash | 2 +-
 package/genimage/genimage.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/genimage/genimage.hash b/package/genimage/genimage.hash
index 71b7601..b01ea46 100644
--- a/package/genimage/genimage.hash
+++ b/package/genimage/genimage.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	7366dcfe4c542298ffe8a6c8d3551b1c3a84e25bfbb76ca75b9692e974f4534a	genimage-7.tar.xz
+sha256	363b2222b8036eca927c464994e7a877539adc3ea9ba895c1e2186f0589fafbf	genimage-8.tar.xz
diff --git a/package/genimage/genimage.mk b/package/genimage/genimage.mk
index 07d95a4..2dffbc5 100644
--- a/package/genimage/genimage.mk
+++ b/package/genimage/genimage.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GENIMAGE_VERSION = 7
+GENIMAGE_VERSION = 8
 GENIMAGE_SOURCE = genimage-$(GENIMAGE_VERSION).tar.xz
 GENIMAGE_SITE = http://www.pengutronix.de/software/genimage/download
 GENIMAGE_DEPENDENCIES = host-pkgconf libconfuse
-- 
2.1.4
