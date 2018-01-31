From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 31 Jan 2018 16:31:08 +0100
Subject: [Buildroot] [git commit branch/2017.11.x] linux-headers: bump 4.{4,
 9}.x series
Message-ID: <20180131153111.325238818C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b4ccebdf8b2a0602805f8f77cdc1aa426ad3cb1e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.11.x

Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 2dbfb76d2e62df2e27b960ffacfbe4600fce4b3f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 314f10ce43..cb6d1c2e1a 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -244,8 +244,8 @@ config BR2_DEFAULT_KERNEL_HEADERS
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
