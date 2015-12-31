From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 31 Dec 2015 15:21:56 +0100
Subject: [Buildroot] [git commit] linux-headers: bump 3.2.x series
Message-ID: <20151231142257.D6A3C827A0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=eac47611bfcaad16561e1cc3c9a1d9d71029157e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/linux-headers/Config.in.host | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 1b8af0a..9fabb9e 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -199,7 +199,7 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "3.2.74"	if BR2_KERNEL_HEADERS_3_2
+	default "3.2.75"	if BR2_KERNEL_HEADERS_3_2
 	default "3.4.110"	if BR2_KERNEL_HEADERS_3_4
 	default "3.10.94"	if BR2_KERNEL_HEADERS_3_10
 	default "3.12.51"	if BR2_KERNEL_HEADERS_3_12
