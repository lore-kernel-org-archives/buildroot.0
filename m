From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 11 Dec 2015 10:11:15 +0000
Subject: [Buildroot] [PATCH 2/2] linux-headers: bump 4.3.x series to 4.3.2
In-Reply-To: <1449828675-14655-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1449828675-14655-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <1449828675-14655-2-git-send-email-Vincent.Riera@imgtec.com>
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
index 3102ea9..f1ca16b 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -211,5 +211,5 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "4.0.9"		if BR2_KERNEL_HEADERS_4_0
 	default "4.1.14"	if BR2_KERNEL_HEADERS_4_1
 	default "4.2.7"		if BR2_KERNEL_HEADERS_4_2
-	default "4.3.1"		if BR2_KERNEL_HEADERS_4_3
+	default "4.3.2"		if BR2_KERNEL_HEADERS_4_3
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
-- 
2.4.10
