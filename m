From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 6 Apr 2018 16:34:16 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] linux-headers: bump 4.{14,
 15}.x series
Message-ID: <20180406165912.B32B983E91@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=513cd51490768cd241b9adaa8e8ea2c16be76e13
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 81c28e83ce2364512ef8741dc3a8dd39fe0f3fa9)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 1560df031b..fd82049fe9 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -248,6 +248,6 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "4.11.12"	if BR2_KERNEL_HEADERS_4_11
 	default "4.12.14"	if BR2_KERNEL_HEADERS_4_12
 	default "4.13.16"	if BR2_KERNEL_HEADERS_4_13
-	default "4.14.26"	if BR2_KERNEL_HEADERS_4_14
-	default "4.15.9"	if BR2_KERNEL_HEADERS_4_15
+	default "4.14.27"	if BR2_KERNEL_HEADERS_4_14
+	default "4.15.10"	if BR2_KERNEL_HEADERS_4_15
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
