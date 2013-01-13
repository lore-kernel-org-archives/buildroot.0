From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 13 Jan 2013 21:12:25 +0100
Subject: [Buildroot] [git commit] barebox: add 2013.01.0, remove 2012.09
Message-ID: <20130113201243.82BD480803@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cbd675224d99113d3b2bddbb95119453cfdcc82b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 boot/barebox/Config.in |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/boot/barebox/Config.in b/boot/barebox/Config.in
index 10eb650..b9e03b3 100644
--- a/boot/barebox/Config.in
+++ b/boot/barebox/Config.in
@@ -8,13 +8,10 @@ config BR2_TARGET_BAREBOX
 if BR2_TARGET_BAREBOX
 choice
 	prompt "version"
-	default BR2_TARGET_BAREBOX_2012_12
+	default BR2_TARGET_BAREBOX_2013_01
 	help
 	  Select the specific Barebox version you want to use
 
-config BR2_TARGET_BAREBOX_2012_09
-	bool "2012.09"
-
 config BR2_TARGET_BAREBOX_2012_10
 	bool "2012.10"
 
@@ -24,6 +21,9 @@ config BR2_TARGET_BAREBOX_2012_11
 config BR2_TARGET_BAREBOX_2012_12
 	bool "2012.12.1"
 
+config BR2_TARGET_BAREBOX_2013_01
+	bool "2013.01.0"
+
 config BR2_TARGET_BAREBOX_CUSTOM_TARBALL
 	bool "Custom tarball"
 
@@ -41,10 +41,10 @@ endif
 
 config BR2_TARGET_BAREBOX_VERSION
 	string
-	default "2012.09.0"	if BR2_TARGET_BAREBOX_2012_09
 	default "2012.10.0"	if BR2_TARGET_BAREBOX_2012_10
 	default "2012.11.0"	if BR2_TARGET_BAREBOX_2012_11
 	default "2012.12.1"	if BR2_TARGET_BAREBOX_2012_12
+	default "2013.01.0"	if BR2_TARGET_BAREBOX_2013_01
 	default "custom"	if BR2_TARGET_BAREBOX_CUSTOM_TARBALL
 	default $BR2_TARGET_BAREBOX_CUSTOM_GIT_VERSION if BR2_TARGET_BAREBOX_CUSTOM_GIT
 
