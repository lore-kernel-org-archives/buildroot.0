From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 21 Sep 2017 17:45:03 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] linux-headers: bump
	3.18.x and 4.1.x series
Message-ID: <20170921153800.97C2C7FED7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=99ab71180fe9dcc646874c79a3825e43bb426e3f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 345236d..89ac5b6 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -218,10 +218,10 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.4.113"	if BR2_KERNEL_HEADERS_3_4
 	default "3.10.107"	if BR2_KERNEL_HEADERS_3_10
 	default "3.12.74"	if BR2_KERNEL_HEADERS_3_12
-	default "3.18.70"	if BR2_KERNEL_HEADERS_3_18
+	default "3.18.71"	if BR2_KERNEL_HEADERS_3_18
 	default "3.19.8"	if BR2_KERNEL_HEADERS_3_19
 	default "4.0.9"		if BR2_KERNEL_HEADERS_4_0
-	default "4.1.43"	if BR2_KERNEL_HEADERS_4_1
+	default "4.1.44"	if BR2_KERNEL_HEADERS_4_1
 	default "4.4.88"	if BR2_KERNEL_HEADERS_4_4
 	default "4.8.17"	if BR2_KERNEL_HEADERS_4_8
 	default "4.9.51"	if BR2_KERNEL_HEADERS_4_9
