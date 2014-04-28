From: Anton Kolesov <Anton.Kolesov@synopsys.com>
Date: Mon, 28 Apr 2014 20:43:25 +0400
Subject: [Buildroot] [PATCH 3/4] binutils: arc: bump to git commit d9c6f91
In-Reply-To: <1398703406-12157-1-git-send-email-Anton.Kolesov@synopsys.com>
References: <1398703406-12157-1-git-send-email-Anton.Kolesov@synopsys.com>
Message-ID: <1398703406-12157-3-git-send-email-Anton.Kolesov@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This revision corresponds to the 4.8-R3 release of the ARC GNU Tool chain.

Signed-off-by: Anton Kolesov <Anton.Kolesov@synopsys.com>
Cc: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
---
 package/binutils/Config.in.host | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index 2f86f51..24d1d25 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -49,7 +49,7 @@ endchoice
 config BR2_BINUTILS_VERSION
 	string
 	default "2.18-avr32-1.0.1" if BR2_BINUTILS_VERSION_2_18_AVR32_1_0_1
-	default "a934fe50786aa0dc0fb5da4754e7e07591c9cd8e" if BR2_arc
+	default "d9c6f9144265210f002bcf26db276bbd4acd5c47" if BR2_arc
 	default "8351467c933d277ebea0c8d99ad2b65b5f7b6bc2" if BR2_microblaze
 	default "2.20.1"	if BR2_BINUTILS_VERSION_2_20_1
 	default "2.21"		if BR2_BINUTILS_VERSION_2_21
-- 
1.8.4.1
