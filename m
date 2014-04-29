From: Anton Kolesov <Anton.Kolesov@synopsys.com>
Date: Tue, 29 Apr 2014 19:31:11 +0400
Subject: [Buildroot] [PATCH v2 1/4] uclibc: arc: bump to arc-4.8-R3 release
In-Reply-To: <535EA9E5.5010909@mind.be>
References: <535EA9E5.5010909@mind.be>
Message-ID: <1398785474-17540-1-git-send-email-Anton.Kolesov@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Anton Kolesov <Anton.Kolesov@synopsys.com>
Cc: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
---
 package/uclibc/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
index 2b93660..cc244a9 100644
--- a/package/uclibc/Config.in
+++ b/package/uclibc/Config.in
@@ -42,7 +42,7 @@ config BR2_UCLIBC_VERSION_STRING
 	default 0.9.31.1	if BR2_UCLIBC_VERSION_0_9_31
 	default 0.9.32.1	if BR2_UCLIBC_VERSION_0_9_32
 	default 0.9.33.2	if BR2_UCLIBC_VERSION_0_9_33
-	default "f37101d94284c692ee9b23bc72ef38b9473cd316" if BR2_arc
+	default "arc-4.8-R3"	if BR2_arc
 	default "7bf35c8b7d4a1f97174eb49f47f33946b282114c" if BR2_UCLIBC_VERSION_XTENSA_GIT
 	default BR2_USE_UCLIBC_SNAPSHOT	if BR2_UCLIBC_VERSION_SNAPSHOT
 
-- 
1.8.4.1
