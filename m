From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 5 Oct 2018 20:28:53 +0200
Subject: [Buildroot] [git commit branch/2018.08.x] linux-headers: bump 4.{4,
 9, 14, 18}.x series
Message-ID: <20181005183258.27D768D29D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=91aa53243eba6b5250f79407db3e8dceaaea6915
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.08.x

[Peter: drop 4.18.x change]
Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit fbfda3fc06d65ddd02befe3c46334a118f0e5e7f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index e1b80eefc9..e9b3a9b339 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -266,13 +266,13 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "3.2.102"	if BR2_KERNEL_HEADERS_3_2
 	default "4.1.52"	if BR2_KERNEL_HEADERS_4_1
-	default "4.4.157"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.128"	if BR2_KERNEL_HEADERS_4_9
+	default "4.4.158"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.129"	if BR2_KERNEL_HEADERS_4_9
 	default "4.10.17"	if BR2_KERNEL_HEADERS_4_10
 	default "4.11.12"	if BR2_KERNEL_HEADERS_4_11
 	default "4.12.14"	if BR2_KERNEL_HEADERS_4_12
 	default "4.13.16"	if BR2_KERNEL_HEADERS_4_13
-	default "4.14.71"	if BR2_KERNEL_HEADERS_4_14
+	default "4.14.72"	if BR2_KERNEL_HEADERS_4_14
 	default "4.15.18"	if BR2_KERNEL_HEADERS_4_15
 	default "4.16.18"	if BR2_KERNEL_HEADERS_4_16
 	default "4.17.19"	if BR2_KERNEL_HEADERS_4_17
