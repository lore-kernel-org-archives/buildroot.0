From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 22 Oct 2015 22:44:59 +0200
Subject: [Buildroot] [git commit] linux-headers: bump 3.4.x series
Message-ID: <20151022204531.39FD181F5F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=19ff7cf7a6ac4396198c44d1cd3ebc3bfaa5a448
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 7001466..e05cef9 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -192,7 +192,7 @@ endchoice
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "3.2.72"	if BR2_KERNEL_HEADERS_3_2
-	default "3.4.109"	if BR2_KERNEL_HEADERS_3_4
+	default "3.4.110"	if BR2_KERNEL_HEADERS_3_4
 	default "3.10.90"	if BR2_KERNEL_HEADERS_3_10
 	default "3.12.49"	if BR2_KERNEL_HEADERS_3_12
 	default "3.14.54"	if BR2_KERNEL_HEADERS_3_14
