From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 9 Dec 2016 17:54:12 +0100
Subject: [Buildroot] [git commit] linux-headers: bump 4.{8, 4, 1}.x and 3.{18,
	12}.x series
Message-ID: <20161209171845.9787181E8C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=397fba1c05f3d44db624e7a2793efe1d94530af3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 9cdd5fa..da17068 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -226,15 +226,15 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.2.84"	if BR2_KERNEL_HEADERS_3_2
 	default "3.4.113"	if BR2_KERNEL_HEADERS_3_4
 	default "3.10.104"	if BR2_KERNEL_HEADERS_3_10
-	default "3.12.67"	if BR2_KERNEL_HEADERS_3_12
+	default "3.12.68"	if BR2_KERNEL_HEADERS_3_12
 	default "3.14.79"	if BR2_KERNEL_HEADERS_3_14
-	default "3.18.44"	if BR2_KERNEL_HEADERS_3_18
+	default "3.18.45"	if BR2_KERNEL_HEADERS_3_18
 	default "3.19.8"	if BR2_KERNEL_HEADERS_3_19
 	default "4.0.9"		if BR2_KERNEL_HEADERS_4_0
-	default "4.1.35"	if BR2_KERNEL_HEADERS_4_1
-	default "4.4.36"	if BR2_KERNEL_HEADERS_4_4
+	default "4.1.36"	if BR2_KERNEL_HEADERS_4_1
+	default "4.4.37"	if BR2_KERNEL_HEADERS_4_4
 	default "4.5.7"		if BR2_KERNEL_HEADERS_4_5
 	default "4.6.7"		if BR2_KERNEL_HEADERS_4_6
 	default "4.7.10"	if BR2_KERNEL_HEADERS_4_7
-	default "4.8.12"	if BR2_KERNEL_HEADERS_4_8
+	default "4.8.13"	if BR2_KERNEL_HEADERS_4_8
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
