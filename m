From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 19 May 2009 20:18:04 +0200
Subject: [Buildroot] [git commit] Update for 2009.05-rc2
Message-ID: <20090519183105.D2DBC7787B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c0f09ddd3fc250e8151e27413f592cb7fb07964b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/tags/2009.05_rc2


Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES   |   11 ++++++++++-
 Config.in |    2 +-
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/CHANGES b/CHANGES
index ec9c8f9..73ee66d 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,8 +1,17 @@
-2009.05-rc2, Released May x, 2009:
+2009.05-rc2, Released May 19th, 2009:
+
+	Fixes for toolchain (gcc w/softfloat on ppc, 3.4.6 buildfix
+	for newer hosts), stable kernel versions, busybox, cups,
+	dmraid, docker, mesa3d, rsync and updated defconfigs.
+
+	xserver marked as broken on AVR32 and atngw100-expanded
+	config removed.
 
 	Issues resolved (http://bugs.uclibc.org):
 
 	#167: metacity does not build
+	#295: gamin installs python support even if python is disabled
+	#323: gen_matypes fails to execute during build of Mesa when us...
 
 2009.05-rc1, Released May 5th, 2009:
 
diff --git a/Config.in b/Config.in
index 16397a5..998bcf1 100644
--- a/Config.in
+++ b/Config.in
@@ -8,7 +8,7 @@ config BR2_HAVE_DOT_CONFIG
 
 config BR2_VERSION
 	string
-	default "2009.05-rc1"
+	default "2009.05-rc2"
 
 source "target/Config.in.arch"
 source "target/device/Config.in"
-- 
1.6.0.6
