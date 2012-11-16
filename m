From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Fri, 16 Nov 2012 23:04:18 +0100
Subject: [Buildroot] [PATCH] barebox: Add 2012.11, remove 2012.07
Message-ID: <1353103459-17468-1-git-send-email-maxime.ripard@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
---
 boot/barebox/Config.in |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/boot/barebox/Config.in b/boot/barebox/Config.in
index d6ce8dd..c9e7088 100644
--- a/boot/barebox/Config.in
+++ b/boot/barebox/Config.in
@@ -8,13 +8,10 @@ config BR2_TARGET_BAREBOX
 if BR2_TARGET_BAREBOX
 choice
 	prompt "version"
-	default BR2_TARGET_BAREBOX_2012_10
+	default BR2_TARGET_BAREBOX_2012_11
 	help
 	  Select the specific Barebox version you want to use
 
-config BR2_TARGET_BAREBOX_2012_07
-	bool "2012.07"
-
 config BR2_TARGET_BAREBOX_2012_08
 	bool "2012.08"
 
@@ -24,6 +21,9 @@ config BR2_TARGET_BAREBOX_2012_09
 config BR2_TARGET_BAREBOX_2012_10
 	bool "2012.10"
 
+config BR2_TARGET_BAREBOX_2012_11
+	bool "2012.11"
+
 config BR2_TARGET_BAREBOX_CUSTOM_TARBALL
 	bool "Custom tarball"
 
-- 
1.7.9.5
