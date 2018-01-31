From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 31 Jan 2018 16:14:40 +0100
Subject: [Buildroot] [git commit] linux-headers: bump 4.{4, 9}.x series
Message-ID: <20180131152435.554AB80301@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2dbfb76d2e62df2e27b960ffacfbe4600fce4b3f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index af00679ca7..b9ba0d994a 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -260,8 +260,8 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.10.108"	if BR2_KERNEL_HEADERS_3_10
 	default "3.12.74"	if BR2_KERNEL_HEADERS_3_12
 	default "4.1.49"	if BR2_KERNEL_HEADERS_4_1
-	default "4.4.113"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.78"	if BR2_KERNEL_HEADERS_4_9
+	default "4.4.114"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.79"	if BR2_KERNEL_HEADERS_4_9
 	default "4.10.17"	if BR2_KERNEL_HEADERS_4_10
 	default "4.11.12"	if BR2_KERNEL_HEADERS_4_11
 	default "4.12.14"	if BR2_KERNEL_HEADERS_4_12
