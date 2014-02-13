From: Anton Kolesov <anton.kolesov@synopsys.com>
Date: Thu, 13 Feb 2014 16:41:47 +0400
Subject: [Buildroot] [PATCH] uclibc: arc: bump to git commit f37101d
In-Reply-To: <1392295308-12937-1-git-send-email-anton.kolesov@synopsys.com>
References: <1392295308-12937-1-git-send-email-anton.kolesov@synopsys.com>
Message-ID: <1392295308-12937-4-git-send-email-anton.kolesov@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Anton Kolesov <anton.kolesov@synopsys.com>
---
 package/uclibc/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
index f5543cc..860e410 100644
--- a/package/uclibc/Config.in
+++ b/package/uclibc/Config.in
@@ -42,7 +42,7 @@ config BR2_UCLIBC_VERSION_STRING
 	default 0.9.31.1	if BR2_UCLIBC_VERSION_0_9_31
 	default 0.9.32.1	if BR2_UCLIBC_VERSION_0_9_32
 	default 0.9.33.2	if BR2_UCLIBC_VERSION_0_9_33
-	default "9f0f466d3b17181ce88be36ce24a775774fe686c" if BR2_arc
+	default "f37101d94284c692ee9b23bc72ef38b9473cd316" if BR2_arc
 	default "7bf35c8b7d4a1f97174eb49f47f33946b282114c" if BR2_UCLIBC_VERSION_XTENSA_GIT
 	default BR2_USE_UCLIBC_SNAPSHOT	if BR2_UCLIBC_VERSION_SNAPSHOT
 
-- 
1.8.4.1
