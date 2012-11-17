From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 17 Nov 2012 09:01:41 +0100
Subject: [Buildroot] [git commit] barebox: Add 2012.11, remove 2012.07
Message-ID: <20121117081559.03F439A05D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0003b0d1f7975f4528c402eefe995b655f64ea4e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 boot/barebox/Config.in |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

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
 
