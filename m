From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 24 Sep 2020 22:05:09 +0200
Subject: [Buildroot] [git commit] linux: add bzImage support for IBM s390x
 and Z arch
Message-ID: <20200924213039.AB0318DF74@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e641b780339c69a8f1cc97e927e9b21e00d3da8b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Alexander Egorenkov <egorenar@linux.ibm.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 linux/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux/Config.in b/linux/Config.in
index 49da2b81b2..ec74e1e65a 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -226,7 +226,7 @@ config BR2_LINUX_KERNEL_APPENDED_UIMAGE
 
 config BR2_LINUX_KERNEL_BZIMAGE
 	bool "bzImage"
-	depends on BR2_i386 || BR2_x86_64
+	depends on BR2_i386 || BR2_x86_64 || BR2_s390x
 
 config BR2_LINUX_KERNEL_ZIMAGE
 	bool "zImage"
