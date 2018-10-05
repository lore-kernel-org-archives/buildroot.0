From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 5 Oct 2018 13:46:21 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] boot/xloader: add
 upstream URL in Config.in help
Message-ID: <20181005114526.758E68040D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=da7e17d2292e49513373ecfe66b4abcc968c2f54
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 78dd830f15b0c175cb8c9d2fef7f0641a8733b29)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/xloader/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/boot/xloader/Config.in b/boot/xloader/Config.in
index c411be478b..f687b897ea 100644
--- a/boot/xloader/Config.in
+++ b/boot/xloader/Config.in
@@ -5,6 +5,8 @@ config BR2_TARGET_XLOADER
 	  The x-loader bootloader. It is mainly used on OMAP-based
 	  platforms.
 
+	  http://omappedia.org/wiki/Linux_OMAP_Kernel_Main
+
 if BR2_TARGET_XLOADER
 config BR2_TARGET_XLOADER_BOARDNAME
 	string "x-loader board name"
