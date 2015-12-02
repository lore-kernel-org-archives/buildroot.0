From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 2 Dec 2015 21:36:19 +0100
Subject: [Buildroot] [git commit] linux-headers: bump 3.{2, 12}.x series
Message-ID: <20151202204630.D56CB80AE0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e3f4ee36e881a0a2b36a4c944728e5d7431b7434
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 560cad7..6559c5e 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -199,10 +199,10 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "3.2.73"	if BR2_KERNEL_HEADERS_3_2
+	default "3.2.74"	if BR2_KERNEL_HEADERS_3_2
 	default "3.4.110"	if BR2_KERNEL_HEADERS_3_4
 	default "3.10.93"	if BR2_KERNEL_HEADERS_3_10
-	default "3.12.50"	if BR2_KERNEL_HEADERS_3_12
+	default "3.12.51"	if BR2_KERNEL_HEADERS_3_12
 	default "3.14.57"	if BR2_KERNEL_HEADERS_3_14
 	default "3.16.7"	if BR2_KERNEL_HEADERS_3_16
 	default "3.17.8"	if BR2_KERNEL_HEADERS_3_17
