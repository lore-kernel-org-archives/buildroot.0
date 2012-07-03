From: Marek Belisko <marek.belisko@open-nandra.com>
Date: Tue,  3 Jul 2012 14:38:01 +0200
Subject: [Buildroot] [patch 1/2] barebox: bump to 2012.07
Message-ID: <1341319082-8362-1-git-send-email-marek.belisko@open-nandra.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Marek Belisko <marek.belisko@open-nandra.com>
---
 boot/barebox/Config.in |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/boot/barebox/Config.in b/boot/barebox/Config.in
index 09a82eb..13009d2 100644
--- a/boot/barebox/Config.in
+++ b/boot/barebox/Config.in
@@ -8,7 +8,7 @@ config BR2_TARGET_BAREBOX
 if BR2_TARGET_BAREBOX
 choice
 	prompt "version"
-	default BR2_TARGET_BAREBOX_2012_04
+	default BR2_TARGET_BAREBOX_2012_07
 	help
 	  Select the specific Barebox version you want to use
 
@@ -25,6 +25,9 @@ config BR2_TARGET_BAREBOX_2012_03
 config BR2_TARGET_BAREBOX_2012_04
 	bool "2012.04"
 
+config BR2_TARGET_BAREBOX_2012_07
+	bool "2012.07"
+
 config BR2_TARGET_BAREBOX_CUSTOM_TARBALL
 	bool "Custom tarball"
 
@@ -46,6 +49,7 @@ config BR2_TARGET_BAREBOX_VERSION
 	default "2012.02.0"	if BR2_TARGET_BAREBOX_2012_02
 	default "2012.03.0"	if BR2_TARGET_BAREBOX_2012_03
 	default "2012.04.0"	if BR2_TARGET_BAREBOX_2012_04
+	default "2012.07.0"	if BR2_TARGET_BAREBOX_2012_07
 	default "custom"	if BR2_TARGET_BAREBOX_CUSTOM_TARBALL
 	default $BR2_TARGET_BAREBOX_CUSTOM_GIT_VERSION if BR2_TARGET_BAREBOX_CUSTOM_GIT
 
-- 
1.7.5.4
