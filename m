From: Baruch Siach <baruch@tkos.co.il>
Date: Mon,  7 Aug 2017 15:41:34 +0300
Subject: [Buildroot] [PATCH] linux: drop full stop from prompt text
Message-ID: <f148d8d9e57d88b3d243d75ed431129822e3b36e.1502109694.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We don't add full stop at the end of the prompt text.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 linux/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux/Config.in b/linux/Config.in
index 1622f01964a9..1b6571a018ea 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -368,7 +368,7 @@ choice
 	default BR2_LINUX_KERNEL_USE_INTREE_DTS
 
 config BR2_LINUX_KERNEL_USE_INTREE_DTS
-	bool "Use a device tree present in the kernel."
+	bool "Use a device tree present in the kernel"
 	help
 	  Use a device tree source distributed with
 	  the kernel sources. The dts files are located
-- 
2.13.2
