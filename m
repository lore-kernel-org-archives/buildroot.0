From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 6 Apr 2018 20:11:00 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] linux: bump default to
 version 4.15.15
Message-ID: <20180407175150.F06EF8100D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=17e3b9adb81fd8b9b506dcbe6ac7e27b51cb918e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 03cdfea134bb74e32795b3cbc9689e70a78d61a8)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux/Config.in b/linux/Config.in
index 040a2341f9..934142c535 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -116,7 +116,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "4.15.14" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "4.15.15" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "v4.4.112-cip18" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
