From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 10 Jan 2018 19:53:41 +0100
Subject: [Buildroot] [git commit] linux: bump default to version 4.14.13
Message-ID: <20180110185515.BE99B83C67@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b52d8100a04c0fe6e87076a8498f1797a704f8c6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux/Config.in b/linux/Config.in
index 9d7ad4f..1e7a9a3 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -116,7 +116,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "4.14.12" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "4.14.13" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "v4.4.105-cip15" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
