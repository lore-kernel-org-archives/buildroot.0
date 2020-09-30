From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 30 Sep 2020 21:50:10 +0200
Subject: [Buildroot] [git commit] package/liberation: bump to version 2.1.1
Message-ID: <20200930194007.6FBE28852A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a7412cdc43a02d904ef720c9cec0b3b188f9c954
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/liberation/liberation.hash | 4 ++--
 package/liberation/liberation.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/liberation/liberation.hash b/package/liberation/liberation.hash
index a15dc23511..f8b0bdac5d 100644
--- a/package/liberation/liberation.hash
+++ b/package/liberation/liberation.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	f14ff0a0be87b5aeb672e669363b5a699db76feb1144b06798261c0fdcd2b24d	liberation-fonts-ttf-2.00.5.tar.gz
-sha256	93fed46019c38bbe566b479d22148e2e8a1e85ada614accb0211c37b2c61c19b	LICENSE
+sha256  8ee2c16fe0f055e60dd8375449aff72d25dd623b9cc6f24790ce9d2e91446fca  liberation-fonts-ttf-2.1.1.tar.gz
+sha256  93fed46019c38bbe566b479d22148e2e8a1e85ada614accb0211c37b2c61c19b  LICENSE
diff --git a/package/liberation/liberation.mk b/package/liberation/liberation.mk
index 495a1ffa63..061830a92f 100644
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
