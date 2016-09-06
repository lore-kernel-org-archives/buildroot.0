From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 6 Sep 2016 21:30:55 +0200
Subject: [Buildroot] [git commit] linux-headers: bump 3.{12,
	18}.x and 4.1.x series
Message-ID: <20160906193115.848538222A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=81c8bd86e3e7be9521a22dc879c5266998659c5a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index f3a99e5..939a20a 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -238,12 +238,12 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.2.81"	if BR2_KERNEL_HEADERS_3_2
 	default "3.4.112"	if BR2_KERNEL_HEADERS_3_4
 	default "3.10.103"	if BR2_KERNEL_HEADERS_3_10
-	default "3.12.62"	if BR2_KERNEL_HEADERS_3_12
+	default "3.12.63"	if BR2_KERNEL_HEADERS_3_12
 	default "3.14.77"	if BR2_KERNEL_HEADERS_3_14
-	default "3.18.40"	if BR2_KERNEL_HEADERS_3_18
+	default "3.18.41"	if BR2_KERNEL_HEADERS_3_18
 	default "3.19.8"	if BR2_KERNEL_HEADERS_3_19
 	default "4.0.9"		if BR2_KERNEL_HEADERS_4_0
-	default "4.1.31"	if BR2_KERNEL_HEADERS_4_1
+	default "4.1.32"	if BR2_KERNEL_HEADERS_4_1
 	default "4.2.8"		if BR2_KERNEL_HEADERS_4_2
 	default "4.3.6"		if BR2_KERNEL_HEADERS_4_3
 	default "4.4.19"	if BR2_KERNEL_HEADERS_4_4
