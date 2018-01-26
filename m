From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 26 Jan 2018 09:31:18 +0100
Subject: [Buildroot] [git commit] linux: bump default to version 4.14.15
Message-ID: <20180126083322.B81658402C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=965f348caeeb2fbf28d3e0344d3b45869b753f95
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux/Config.in b/linux/Config.in
index 23c7770..e38a73b 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -116,7 +116,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "4.14.14" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "4.14.15" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "v4.4.105-cip15" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
