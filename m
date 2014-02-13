From: Anton Kolesov <anton.kolesov@synopsys.com>
Date: Thu, 13 Feb 2014 16:41:46 +0400
Subject: [Buildroot] [PATCH] binutils: arc: Bump to git commit a934fe5
In-Reply-To: <1392295308-12937-1-git-send-email-anton.kolesov@synopsys.com>
References: <1392295308-12937-1-git-send-email-anton.kolesov@synopsys.com>
Message-ID: <1392295308-12937-3-git-send-email-anton.kolesov@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Anton Kolesov <anton.kolesov@synopsys.com>
---
 package/binutils/Config.in.host | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index 49b857e..58738e8 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -49,7 +49,7 @@ endchoice
 config BR2_BINUTILS_VERSION
 	string
 	default "2.18-avr32-1.0.1" if BR2_BINUTILS_VERSION_2_18_AVR32_1_0_1
-	default "0c824ba511fa9b028220eb3c39b566af89ac9dda" if BR2_arc
+	default "a934fe50786aa0dc0fb5da4754e7e07591c9cd8e" if BR2_arc
 	default "8351467c933d277ebea0c8d99ad2b65b5f7b6bc2" if BR2_microblaze
 	default "2.20.1"	if BR2_BINUTILS_VERSION_2_20_1
 	default "2.21"		if BR2_BINUTILS_VERSION_2_21
-- 
1.8.4.1
