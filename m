From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 1 Feb 2016 19:56:27 +0100
Subject: [Buildroot] [git commit] linux-headers: bump 4.{1, 3, 4}.x series
Message-ID: <20160201224708.153C17F892@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=55052ea83fabfca244a08a5480a9f01bdfcef42f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/linux-headers/Config.in.host | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index bdc7ef0..e556bbf 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -211,8 +211,8 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.18.26"	if BR2_KERNEL_HEADERS_3_18
 	default "3.19.8"	if BR2_KERNEL_HEADERS_3_19
 	default "4.0.9"		if BR2_KERNEL_HEADERS_4_0
-	default "4.1.16"	if BR2_KERNEL_HEADERS_4_1
+	default "4.1.17"	if BR2_KERNEL_HEADERS_4_1
 	default "4.2.8"		if BR2_KERNEL_HEADERS_4_2
-	default "4.3.4"		if BR2_KERNEL_HEADERS_4_3
-	default "4.4"		if BR2_KERNEL_HEADERS_4_4
+	default "4.3.5"		if BR2_KERNEL_HEADERS_4_3
+	default "4.4.1"		if BR2_KERNEL_HEADERS_4_4
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
