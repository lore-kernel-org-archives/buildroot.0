From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Apr 2016 16:50:59 +0200
Subject: [Buildroot] [git commit] linux-headers: bump 3.2.x series
Message-ID: <20160402145127.0469C807BE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=136156372ef4fc7582bec0ba68f543961683b008
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/linux-headers/Config.in.host | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 31c4d24..72cd5e1 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -210,7 +210,7 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "3.2.78"	if BR2_KERNEL_HEADERS_3_2
+	default "3.2.79"	if BR2_KERNEL_HEADERS_3_2
 	default "3.4.111"	if BR2_KERNEL_HEADERS_3_4
 	default "3.10.101"	if BR2_KERNEL_HEADERS_3_10
 	default "3.12.56"	if BR2_KERNEL_HEADERS_3_12
