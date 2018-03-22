From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 22 Mar 2018 23:42:42 +0100
Subject: [Buildroot] [git commit] linux: bump default to version 4.15.12
Message-ID: <20180322230316.312D880301@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c2fe7b6bc88e89ae26d8ec37a5d190c9359de54b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux/Config.in b/linux/Config.in
index ce1e121fde..4aa13cd442 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -116,7 +116,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "4.15.11" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "4.15.12" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "v4.4.112-cip18" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
