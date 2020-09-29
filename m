From: Francois Perrad <fperrad@gmail.com>
Date: Tue, 29 Sep 2020 13:03:10 +0200
Subject: [Buildroot] [PATCH] package/liberation: bump to version 2.1.1 lib
Message-ID: <20200929110310.2259238-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/liberation/liberation.hash | 4 ++--
 package/liberation/liberation.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/liberation/liberation.hash b/package/liberation/liberation.hash
index a15dc2351..f8b0bdac5 100644
--- a/package/liberation/liberation.hash
+++ b/package/liberation/liberation.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	f14ff0a0be87b5aeb672e669363b5a699db76feb1144b06798261c0fdcd2b24d	liberation-fonts-ttf-2.00.5.tar.gz
-sha256	93fed46019c38bbe566b479d22148e2e8a1e85ada614accb0211c37b2c61c19b	LICENSE
+sha256  8ee2c16fe0f055e60dd8375449aff72d25dd623b9cc6f24790ce9d2e91446fca  liberation-fonts-ttf-2.1.1.tar.gz
+sha256  93fed46019c38bbe566b479d22148e2e8a1e85ada614accb0211c37b2c61c19b  LICENSE
diff --git a/package/liberation/liberation.mk b/package/liberation/liberation.mk
index 495a1ffa6..061830a92 100644
--- a/package/liberation/liberation.mk
+++ b/package/liberation/liberation.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBERATION_VERSION = 2.00.5
-LIBERATION_SITE = https://github.com/liberationfonts/liberation-fonts/files/2926169
+LIBERATION_VERSION = 2.1.1
+LIBERATION_SITE = https://github.com/liberationfonts/liberation-fonts/files/4743886
 LIBERATION_SOURCE = liberation-fonts-ttf-$(LIBERATION_VERSION).tar.gz
 LIBERATION_TARGET_DIR = $(TARGET_DIR)/usr/share/fonts/liberation
 LIBERATION_LICENSE = OFL-1.1
-- 
2.25.1
