From: Anton Kolesov <Anton.Kolesov@synopsys.com>
Date: Tue, 29 Apr 2014 19:31:13 +0400
Subject: [Buildroot] [PATCH v2 3/4] binutils: arc: bump to arc-4.8-R3 release
In-Reply-To: <1398785474-17540-1-git-send-email-Anton.Kolesov@synopsys.com>
References: <1398785474-17540-1-git-send-email-Anton.Kolesov@synopsys.com>
Message-ID: <1398785474-17540-3-git-send-email-Anton.Kolesov@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Anton Kolesov <Anton.Kolesov@synopsys.com>
Cc: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
---
 package/binutils/Config.in.host | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index 5515570..15def13 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -49,7 +49,7 @@ endchoice
 config BR2_BINUTILS_VERSION
 	string
 	default "2.18-avr32-1.0.1" if BR2_BINUTILS_VERSION_2_18_AVR32_1_0_1
-	default "a934fe50786aa0dc0fb5da4754e7e07591c9cd8e" if BR2_arc
+	default "arc-4.8-R3"	if BR2_arc
 	default "2.20.1"	if BR2_BINUTILS_VERSION_2_20_1
 	default "2.21"		if BR2_BINUTILS_VERSION_2_21
 	default "2.21.1"	if BR2_BINUTILS_VERSION_2_21_1
-- 
1.8.4.1
