From: Alexander Egorenkov <egorenar@linux.ibm.com>
Date: Thu, 17 Sep 2020 06:07:53 +0200
Subject: [Buildroot] [PATCH v4 03/12] linux: add bzImage support for IBM
 s390x and Z arch
In-Reply-To: <20200917040802.846896-1-egorenar@linux.ibm.com>
References: <20200917040802.846896-1-egorenar@linux.ibm.com>
Message-ID: <20200917040802.846896-4-egorenar@linux.ibm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Alexander Egorenkov <egorenar@linux.ibm.com>
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
-- 
2.26.2
