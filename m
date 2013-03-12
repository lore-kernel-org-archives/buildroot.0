From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 12 Mar 2013 22:32:31 +0100
Subject: [Buildroot] [git commit] barebox: add 2013.03.0, remove 2012.11
Message-ID: <20130312213218.191E59B061@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a7fbcd013be42075a3c98056bcb82a471c2ff7a3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 boot/barebox/Config.in |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/boot/barebox/Config.in b/boot/barebox/Config.in
index 769a1bd..f111c04 100644
--- a/boot/barebox/Config.in
+++ b/boot/barebox/Config.in
@@ -8,13 +8,10 @@ config BR2_TARGET_BAREBOX
 if BR2_TARGET_BAREBOX
 choice
 	prompt "version"
-	default BR2_TARGET_BAREBOX_2013_02
+	default BR2_TARGET_BAREBOX_2013_03
 	help
 	  Select the specific Barebox version you want to use
 
-config BR2_TARGET_BAREBOX_2012_11
-	bool "2012.11"
-
 config BR2_TARGET_BAREBOX_2012_12
 	bool "2012.12.1"
 
@@ -24,6 +21,9 @@ config BR2_TARGET_BAREBOX_2013_01
 config BR2_TARGET_BAREBOX_2013_02
 	bool "2013.02.0"
 
+config BR2_TARGET_BAREBOX_2013_03
+	bool "2013.03.0"
+
 config BR2_TARGET_BAREBOX_CUSTOM_TARBALL
 	bool "Custom tarball"
 
@@ -41,10 +41,10 @@ endif
 
 config BR2_TARGET_BAREBOX_VERSION
 	string
-	default "2012.11.0"	if BR2_TARGET_BAREBOX_2012_11
 	default "2012.12.1"	if BR2_TARGET_BAREBOX_2012_12
 	default "2013.01.0"	if BR2_TARGET_BAREBOX_2013_01
 	default "2013.02.0"	if BR2_TARGET_BAREBOX_2013_02
+	default "2013.03.0"	if BR2_TARGET_BAREBOX_2013_03
 	default "custom"	if BR2_TARGET_BAREBOX_CUSTOM_TARBALL
 	default $BR2_TARGET_BAREBOX_CUSTOM_GIT_VERSION if BR2_TARGET_BAREBOX_CUSTOM_GIT
 
