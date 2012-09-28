From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 28 Sep 2012 22:08:35 +0200
Subject: [Buildroot] [git commit] barebox: add 2012.08 / .09, drop .04 / .05
Message-ID: <20120929201754.57C5A9975D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7626c20f92c44c26e0f8c0dfbf2db07cf5bf60a3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 boot/barebox/Config.in |   18 +++++++++---------
 1 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/boot/barebox/Config.in b/boot/barebox/Config.in
index 574bfae..172b540 100644
--- a/boot/barebox/Config.in
+++ b/boot/barebox/Config.in
@@ -8,22 +8,22 @@ config BR2_TARGET_BAREBOX
 if BR2_TARGET_BAREBOX
 choice
 	prompt "version"
-	default BR2_TARGET_BAREBOX_2012_07
+	default BR2_TARGET_BAREBOX_2012_09
 	help
 	  Select the specific Barebox version you want to use
 
-config BR2_TARGET_BAREBOX_2012_04
-	bool "2012.04"
-
-config BR2_TARGET_BAREBOX_2012_05
-	bool "2012.05"
-
 config BR2_TARGET_BAREBOX_2012_06
 	bool "2012.06"
 
 config BR2_TARGET_BAREBOX_2012_07
 	bool "2012.07"
 
+config BR2_TARGET_BAREBOX_2012_08
+	bool "2012.08"
+
+config BR2_TARGET_BAREBOX_2012_09
+	bool "2012.09"
+
 config BR2_TARGET_BAREBOX_CUSTOM_TARBALL
 	bool "Custom tarball"
 
@@ -41,10 +41,10 @@ endif
 
 config BR2_TARGET_BAREBOX_VERSION
 	string
-	default "2012.04.0"	if BR2_TARGET_BAREBOX_2012_04
-	default "2012.05.0"	if BR2_TARGET_BAREBOX_2012_05
 	default "2012.06.0"	if BR2_TARGET_BAREBOX_2012_06
 	default "2012.07.0"	if BR2_TARGET_BAREBOX_2012_07
+	default "2012.08.0"	if BR2_TARGET_BAREBOX_2012_08
+	default "2012.09.0"	if BR2_TARGET_BAREBOX_2012_09
 	default "custom"	if BR2_TARGET_BAREBOX_CUSTOM_TARBALL
 	default $BR2_TARGET_BAREBOX_CUSTOM_GIT_VERSION if BR2_TARGET_BAREBOX_CUSTOM_GIT
 
