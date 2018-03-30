From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 30 Mar 2018 23:04:57 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] linux-headers: bump 4.{14,
 15}.x series
Message-ID: <20180330213159.1B76083EBB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3b76f2b3dd27fb7f6421adc69497e5b461303be9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 324cc39ba13a3cbdd1f146cf59d0f145661830bc)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index d74f267a2e..3723e8edec 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -248,6 +248,6 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "4.11.12"	if BR2_KERNEL_HEADERS_4_11
 	default "4.12.14"	if BR2_KERNEL_HEADERS_4_12
 	default "4.13.16"	if BR2_KERNEL_HEADERS_4_13
-	default "4.14.24"	if BR2_KERNEL_HEADERS_4_14
-	default "4.15.7"	if BR2_KERNEL_HEADERS_4_15
+	default "4.14.25"	if BR2_KERNEL_HEADERS_4_14
+	default "4.15.8"	if BR2_KERNEL_HEADERS_4_15
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
