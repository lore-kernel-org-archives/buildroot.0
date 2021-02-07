From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  7 Feb 2021 13:17:53 +0100
Subject: [Buildroot] [PATCH 1/1] package/liberation: bump version to 2.1.2
Message-ID: <20210207121753.1263191-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changelog:
https://github.com/liberationfonts/liberation-fonts/blob/master/ChangeLog

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/liberation/liberation.hash | 2 +-
 package/liberation/liberation.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/liberation/liberation.hash b/package/liberation/liberation.hash
index f8b0bdac5d..6606142d86 100644
--- a/package/liberation/liberation.hash
+++ b/package/liberation/liberation.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  8ee2c16fe0f055e60dd8375449aff72d25dd623b9cc6f24790ce9d2e91446fca  liberation-fonts-ttf-2.1.1.tar.gz
+sha256  14694930f28391675008c67b18889d1a7dfea74b16adf50394f8057b57eaf8e0  liberation-fonts-ttf-2.1.2.tar.gz
 sha256  93fed46019c38bbe566b479d22148e2e8a1e85ada614accb0211c37b2c61c19b  LICENSE
diff --git a/package/liberation/liberation.mk b/package/liberation/liberation.mk
index 061830a92f..522a038ddd 100644
--- a/package/liberation/liberation.mk
+++ b/package/liberation/liberation.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBERATION_VERSION = 2.1.1
-LIBERATION_SITE = https://github.com/liberationfonts/liberation-fonts/files/4743886
+LIBERATION_VERSION = 2.1.2
+LIBERATION_SITE = https://github.com/liberationfonts/liberation-fonts/files/5722233
 LIBERATION_SOURCE = liberation-fonts-ttf-$(LIBERATION_VERSION).tar.gz
 LIBERATION_TARGET_DIR = $(TARGET_DIR)/usr/share/fonts/liberation
 LIBERATION_LICENSE = OFL-1.1
-- 
2.29.2
