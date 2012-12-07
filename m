From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Fri,  7 Dec 2012 11:51:30 +0100
Subject: [Buildroot] [PATCH] barebox: add 2012.12, remove 2012.08
Message-ID: <1354877490-15585-1-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 boot/barebox/Config.in | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/boot/barebox/Config.in b/boot/barebox/Config.in
index 95f330f..e7498a8 100644
--- a/boot/barebox/Config.in
+++ b/boot/barebox/Config.in
@@ -8,13 +8,10 @@ config BR2_TARGET_BAREBOX
 if BR2_TARGET_BAREBOX
 choice
 	prompt "version"
-	default BR2_TARGET_BAREBOX_2012_11
+	default BR2_TARGET_BAREBOX_2012_12
 	help
 	  Select the specific Barebox version you want to use
 
-config BR2_TARGET_BAREBOX_2012_08
-	bool "2012.08"
-
 config BR2_TARGET_BAREBOX_2012_09
 	bool "2012.09"
 
@@ -24,6 +21,9 @@ config BR2_TARGET_BAREBOX_2012_10
 config BR2_TARGET_BAREBOX_2012_11
 	bool "2012.11"
 
+config BR2_TARGET_BAREBOX_2012_12
+	bool "2012.12"
+
 config BR2_TARGET_BAREBOX_CUSTOM_TARBALL
 	bool "Custom tarball"
 
@@ -41,10 +41,10 @@ endif
 
 config BR2_TARGET_BAREBOX_VERSION
 	string
-	default "2012.08.0"	if BR2_TARGET_BAREBOX_2012_08
 	default "2012.09.0"	if BR2_TARGET_BAREBOX_2012_09
 	default "2012.10.0"	if BR2_TARGET_BAREBOX_2012_10
 	default "2012.11.0"	if BR2_TARGET_BAREBOX_2012_11
+	default "2012.12.0"	if BR2_TARGET_BAREBOX_2012_12
 	default "custom"	if BR2_TARGET_BAREBOX_CUSTOM_TARBALL
 	default $BR2_TARGET_BAREBOX_CUSTOM_GIT_VERSION if BR2_TARGET_BAREBOX_CUSTOM_GIT
 
-- 
1.8.0
