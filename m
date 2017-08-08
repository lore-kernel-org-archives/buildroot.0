From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 8 Aug 2017 17:14:04 +0200
Subject: [Buildroot] [git commit branch/next] linux: drop full stop from
	prompt text
Message-ID: <20170809225749.4D3137FF5E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0cfe1332d816d791b86ff353fc0ea99d55d8f2c7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

We don't add a full stop at the end of the prompt text.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 linux/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux/Config.in b/linux/Config.in
index 59cb3af..b654b5d 100644
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
