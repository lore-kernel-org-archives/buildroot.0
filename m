From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 13 Dec 2012 09:37:10 +0100
Subject: [Buildroot] [git commit] barebox: bump to version 2012.12.1
Message-ID: <20121213083804.D5BD69A1F0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e043dd6c99a801dc7f863986c78c947e25c75b3f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 boot/barebox/Config.in |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/boot/barebox/Config.in b/boot/barebox/Config.in
index e7498a8..10eb650 100644
--- a/boot/barebox/Config.in
+++ b/boot/barebox/Config.in
@@ -22,7 +22,7 @@ config BR2_TARGET_BAREBOX_2012_11
 	bool "2012.11"
 
 config BR2_TARGET_BAREBOX_2012_12
-	bool "2012.12"
+	bool "2012.12.1"
 
 config BR2_TARGET_BAREBOX_CUSTOM_TARBALL
 	bool "Custom tarball"
@@ -44,7 +44,7 @@ config BR2_TARGET_BAREBOX_VERSION
 	default "2012.09.0"	if BR2_TARGET_BAREBOX_2012_09
 	default "2012.10.0"	if BR2_TARGET_BAREBOX_2012_10
 	default "2012.11.0"	if BR2_TARGET_BAREBOX_2012_11
-	default "2012.12.0"	if BR2_TARGET_BAREBOX_2012_12
+	default "2012.12.1"	if BR2_TARGET_BAREBOX_2012_12
 	default "custom"	if BR2_TARGET_BAREBOX_CUSTOM_TARBALL
 	default $BR2_TARGET_BAREBOX_CUSTOM_GIT_VERSION if BR2_TARGET_BAREBOX_CUSTOM_GIT
 
