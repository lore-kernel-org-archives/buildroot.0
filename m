From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 6 Mar 2012 22:55:30 +0100
Subject: [Buildroot] [git commit] barebox: add 2012.03 release
Message-ID: <20120306215605.34C7E90D15@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=dc0589b7d6aa057cad083370cb3d9b5547be60e0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 boot/barebox/Config.in |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/boot/barebox/Config.in b/boot/barebox/Config.in
index c335af0..5cc7dca 100644
--- a/boot/barebox/Config.in
+++ b/boot/barebox/Config.in
@@ -8,7 +8,7 @@ config BR2_TARGET_BAREBOX
 if BR2_TARGET_BAREBOX
 choice
 	prompt "version"
-	default BR2_TARGET_BAREBOX_2012_02
+	default BR2_TARGET_BAREBOX_2012_03
 	help
 	  Select the specific Barebox version you want to use
 
@@ -22,6 +22,9 @@ config BR2_TARGET_BAREBOX_2012_01
 config BR2_TARGET_BAREBOX_2012_02
 	bool "2012.02"
 
+config BR2_TARGET_BAREBOX_2012_03
+	bool "2012.03"
+
 config BR2_TARGET_BAREBOX_CUSTOM_TARBALL
 	bool "Custom tarball"
 
@@ -42,6 +45,7 @@ config BR2_TARGET_BAREBOX_VERSION
 	default "2011.12.0"	if BR2_TARGET_BAREBOX_2011_12
 	default "2012.01.0"	if BR2_TARGET_BAREBOX_2012_01
 	default "2012.02.0"	if BR2_TARGET_BAREBOX_2012_02
+	default "2012.03.0"	if BR2_TARGET_BAREBOX_2012_02
 	default "custom"	if BR2_TARGET_BAREBOX_CUSTOM_TARBALL
 	default $BR2_TARGET_BAREBOX_CUSTOM_GIT_VERSION if BR2_TARGET_BAREBOX_CUSTOM_GIT
 
