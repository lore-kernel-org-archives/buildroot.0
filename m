From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 17 Aug 2016 08:22:11 +0200
Subject: [Buildroot] [git commit] linux-headers: bump 3.14.x and 4.{4, 6,
	7}.x series
Message-ID: <20160817064348.E28EA802DD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=29a0a9f00ce4eb1553bfb0ffa33139c2c78bd657
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 771befb..3384cb0 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -239,15 +239,15 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.4.112"	if BR2_KERNEL_HEADERS_3_4
 	default "3.10.102"	if BR2_KERNEL_HEADERS_3_10
 	default "3.12.62"	if BR2_KERNEL_HEADERS_3_12
-	default "3.14.75"	if BR2_KERNEL_HEADERS_3_14
+	default "3.14.76"	if BR2_KERNEL_HEADERS_3_14
 	default "3.18.39"	if BR2_KERNEL_HEADERS_3_18
 	default "3.19.8"	if BR2_KERNEL_HEADERS_3_19
 	default "4.0.9"		if BR2_KERNEL_HEADERS_4_0
 	default "4.1.30"	if BR2_KERNEL_HEADERS_4_1
 	default "4.2.8"		if BR2_KERNEL_HEADERS_4_2
 	default "4.3.6"		if BR2_KERNEL_HEADERS_4_3
-	default "4.4.17"	if BR2_KERNEL_HEADERS_4_4
+	default "4.4.18"	if BR2_KERNEL_HEADERS_4_4
 	default "4.5.7"		if BR2_KERNEL_HEADERS_4_5
-	default "4.6.6"		if BR2_KERNEL_HEADERS_4_6
-	default "4.7"		if BR2_KERNEL_HEADERS_4_7
+	default "4.6.7"		if BR2_KERNEL_HEADERS_4_6
+	default "4.7.1"		if BR2_KERNEL_HEADERS_4_7
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
