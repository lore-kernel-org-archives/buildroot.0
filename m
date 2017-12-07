From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu,  7 Dec 2017 18:43:52 +0100
Subject: [Buildroot] [PATCH 1/1] linux-headers: bump 4.1.x series
Message-ID: <20171207174352.5148-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
Please note that the patch for mm/huge_memory.c
https://github.com/torvalds/linux/commit/a8f97366452ed491d13cf1e44241bc0b5740b1f0
fixing CVE-2017-1000405 was not included in this kernel version:

https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/diff/?id=v4.1.47&id2=v4.1.46&dt=2
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/log/mm/huge_memory.c?id=v4.1.47

 package/linux-headers/Config.in.host | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 3e146bb1b1..b471284919 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -251,7 +251,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.4.113"	if BR2_KERNEL_HEADERS_3_4
 	default "3.10.108"	if BR2_KERNEL_HEADERS_3_10
 	default "3.12.74"	if BR2_KERNEL_HEADERS_3_12
-	default "4.1.46"	if BR2_KERNEL_HEADERS_4_1
+	default "4.1.47"	if BR2_KERNEL_HEADERS_4_1
 	default "4.4.104"	if BR2_KERNEL_HEADERS_4_4
 	default "4.9.67"	if BR2_KERNEL_HEADERS_4_9
 	default "4.10.17"	if BR2_KERNEL_HEADERS_4_10
-- 
2.11.0
