From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 7 Mar 2012 16:26:50 +0100
Subject: [Buildroot] [git commit] barebox: fix 2012.03 typo
Message-ID: <20120307152723.396B090D18@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b50f7a832de2801aeee33146ff5a81945f4078c2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Thanks to Eric B??nard for noticing.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 boot/barebox/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/boot/barebox/Config.in b/boot/barebox/Config.in
index 5cc7dca..4048d97 100644
--- a/boot/barebox/Config.in
+++ b/boot/barebox/Config.in
@@ -45,7 +45,7 @@ config BR2_TARGET_BAREBOX_VERSION
 	default "2011.12.0"	if BR2_TARGET_BAREBOX_2011_12
 	default "2012.01.0"	if BR2_TARGET_BAREBOX_2012_01
 	default "2012.02.0"	if BR2_TARGET_BAREBOX_2012_02
-	default "2012.03.0"	if BR2_TARGET_BAREBOX_2012_02
+	default "2012.03.0"	if BR2_TARGET_BAREBOX_2012_03
 	default "custom"	if BR2_TARGET_BAREBOX_CUSTOM_TARBALL
 	default $BR2_TARGET_BAREBOX_CUSTOM_GIT_VERSION if BR2_TARGET_BAREBOX_CUSTOM_GIT
 
