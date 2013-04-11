From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 11 Apr 2013 15:52:16 +0200
Subject: [Buildroot] [git commit] barebox: add 2013.04.0, remove 2012.12.1
Message-ID: <20130411140825.A1F899B586@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=099b41b91dc83692460006a6973af0a8bb91f879
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 boot/barebox/Config.in |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/boot/barebox/Config.in b/boot/barebox/Config.in
index f111c04..581cc52 100644
--- a/boot/barebox/Config.in
+++ b/boot/barebox/Config.in
@@ -8,13 +8,10 @@ config BR2_TARGET_BAREBOX
 if BR2_TARGET_BAREBOX
 choice
 	prompt "version"
-	default BR2_TARGET_BAREBOX_2013_03
+	default BR2_TARGET_BAREBOX_2013_04
 	help
 	  Select the specific Barebox version you want to use
 
-config BR2_TARGET_BAREBOX_2012_12
-	bool "2012.12.1"
-
 config BR2_TARGET_BAREBOX_2013_01
 	bool "2013.01.0"
 
@@ -24,6 +21,9 @@ config BR2_TARGET_BAREBOX_2013_02
 config BR2_TARGET_BAREBOX_2013_03
 	bool "2013.03.0"
 
+config BR2_TARGET_BAREBOX_2013_04
+	bool "2013.04.0"
+
 config BR2_TARGET_BAREBOX_CUSTOM_TARBALL
 	bool "Custom tarball"
 
@@ -41,10 +41,10 @@ endif
 
 config BR2_TARGET_BAREBOX_VERSION
 	string
-	default "2012.12.1"	if BR2_TARGET_BAREBOX_2012_12
 	default "2013.01.0"	if BR2_TARGET_BAREBOX_2013_01
 	default "2013.02.0"	if BR2_TARGET_BAREBOX_2013_02
 	default "2013.03.0"	if BR2_TARGET_BAREBOX_2013_03
+	default "2013.04.0"	if BR2_TARGET_BAREBOX_2013_04
 	default "custom"	if BR2_TARGET_BAREBOX_CUSTOM_TARBALL
 	default $BR2_TARGET_BAREBOX_CUSTOM_GIT_VERSION if BR2_TARGET_BAREBOX_CUSTOM_GIT
 
