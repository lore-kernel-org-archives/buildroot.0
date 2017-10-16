From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 16 Oct 2017 10:03:03 +0200
Subject: [Buildroot] [git commit] linux: bump default to version 4.13.7
Message-ID: <20171016075612.773DC81130@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e716315ce0f48fc97ba872f3f4d74e5e4016bfef
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux/Config.in b/linux/Config.in
index 1941c53..f93655f 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -116,7 +116,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "4.13.6" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "4.13.7" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "v4.4.83-cip8" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
