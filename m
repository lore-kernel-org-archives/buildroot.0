From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 4 Mar 2018 18:36:11 +0100
Subject: [Buildroot] [git commit] linux-headers: bump 4.{9, 14}.x series
Message-ID: <20180304174116.665DF81569@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=59e8b056ab1ed0e32b1913a9eee7d66a3c39ff0b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 397068d49b..d74f267a2e 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -243,11 +243,11 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.2.99"	if BR2_KERNEL_HEADERS_3_2
 	default "4.1.49"	if BR2_KERNEL_HEADERS_4_1
 	default "4.4.119"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.85"	if BR2_KERNEL_HEADERS_4_9
+	default "4.9.86"	if BR2_KERNEL_HEADERS_4_9
 	default "4.10.17"	if BR2_KERNEL_HEADERS_4_10
 	default "4.11.12"	if BR2_KERNEL_HEADERS_4_11
 	default "4.12.14"	if BR2_KERNEL_HEADERS_4_12
 	default "4.13.16"	if BR2_KERNEL_HEADERS_4_13
-	default "4.14.23"	if BR2_KERNEL_HEADERS_4_14
+	default "4.14.24"	if BR2_KERNEL_HEADERS_4_14
 	default "4.15.7"	if BR2_KERNEL_HEADERS_4_15
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
