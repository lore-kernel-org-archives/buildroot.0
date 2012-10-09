From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 9 Oct 2012 11:44:43 +0200
Subject: [Buildroot] [git commit] barebox: add 2012.10, remove 2012.06
Message-ID: <20121009094541.96F0C9980E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1e6fb81dd6a848f48e259fc6335a811b0801971f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 boot/barebox/Config.in |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/boot/barebox/Config.in b/boot/barebox/Config.in
index 172b540..bd70e58 100644
--- a/boot/barebox/Config.in
+++ b/boot/barebox/Config.in
@@ -8,13 +8,10 @@ config BR2_TARGET_BAREBOX
 if BR2_TARGET_BAREBOX
 choice
 	prompt "version"
-	default BR2_TARGET_BAREBOX_2012_09
+	default BR2_TARGET_BAREBOX_2012_10
 	help
 	  Select the specific Barebox version you want to use
 
-config BR2_TARGET_BAREBOX_2012_06
-	bool "2012.06"
-
 config BR2_TARGET_BAREBOX_2012_07
 	bool "2012.07"
 
@@ -24,6 +21,9 @@ config BR2_TARGET_BAREBOX_2012_08
 config BR2_TARGET_BAREBOX_2012_09
 	bool "2012.09"
 
+config BR2_TARGET_BAREBOX_2012_10
+	bool "2012.10"
+
 config BR2_TARGET_BAREBOX_CUSTOM_TARBALL
 	bool "Custom tarball"
 
@@ -41,10 +41,10 @@ endif
 
 config BR2_TARGET_BAREBOX_VERSION
 	string
-	default "2012.06.0"	if BR2_TARGET_BAREBOX_2012_06
 	default "2012.07.0"	if BR2_TARGET_BAREBOX_2012_07
 	default "2012.08.0"	if BR2_TARGET_BAREBOX_2012_08
 	default "2012.09.0"	if BR2_TARGET_BAREBOX_2012_09
+	default "2012.10.0"	if BR2_TARGET_BAREBOX_2012_10
 	default "custom"	if BR2_TARGET_BAREBOX_CUSTOM_TARBALL
 	default $BR2_TARGET_BAREBOX_CUSTOM_GIT_VERSION if BR2_TARGET_BAREBOX_CUSTOM_GIT
 
