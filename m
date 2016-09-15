From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Thu, 15 Sep 2016 09:54:43 +0100
Subject: [Buildroot] [PATCH 1/2] linux-headers: bump 4.7.x series to 4.7.4
Message-ID: <1473929684-34787-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/linux-headers/Config.in.host | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index cbfaa26..b686467 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -243,5 +243,5 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "4.4.19"	if BR2_KERNEL_HEADERS_4_4
 	default "4.5.7"		if BR2_KERNEL_HEADERS_4_5
 	default "4.6.7"		if BR2_KERNEL_HEADERS_4_6
-	default "4.7.3"		if BR2_KERNEL_HEADERS_4_7
+	default "4.7.4"		if BR2_KERNEL_HEADERS_4_7
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
-- 
2.7.3
