From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 8 Apr 2018 21:37:39 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] linux: bump default to
 version 4.15.16
Message-ID: <20180408194524.0585B80428@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=186489f7fe70b1d7b3e5fbfb2cc38a1a0283267a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit bbbcfa57f80d239f94669586cadad4e14f073a5f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux/Config.in b/linux/Config.in
index 934142c535..142d42e10c 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -116,7 +116,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "4.15.15" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "4.15.16" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "v4.4.112-cip18" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
