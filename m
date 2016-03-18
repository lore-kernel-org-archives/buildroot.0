From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 18 Mar 2016 21:54:43 +0100
Subject: [Buildroot] [git commit] linux-headers: bump 3.18.x and 4.1.x series
Message-ID: <20160318205619.8434A81D43@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=39c54fe379eabeb37e6841d2c9f04dfa4e357f2d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index ae44a2f..2fafbd7 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -215,10 +215,10 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.10.101"	if BR2_KERNEL_HEADERS_3_10
 	default "3.12.56"	if BR2_KERNEL_HEADERS_3_12
 	default "3.14.65"	if BR2_KERNEL_HEADERS_3_14
-	default "3.18.28"	if BR2_KERNEL_HEADERS_3_18
+	default "3.18.29"	if BR2_KERNEL_HEADERS_3_18
 	default "3.19.8"	if BR2_KERNEL_HEADERS_3_19
 	default "4.0.9"		if BR2_KERNEL_HEADERS_4_0
-	default "4.1.19"	if BR2_KERNEL_HEADERS_4_1
+	default "4.1.20"	if BR2_KERNEL_HEADERS_4_1
 	default "4.2.8"		if BR2_KERNEL_HEADERS_4_2
 	default "4.3.6"		if BR2_KERNEL_HEADERS_4_3
 	default "4.4.6"		if BR2_KERNEL_HEADERS_4_4
