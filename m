From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 12 Jun 2018 22:21:09 +0200
Subject: [Buildroot] [git commit] linux-headers: bump 4.{14, 16, 17}.x series
Message-ID: <20180612202315.73395883BA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0fee303fff5d6cb979a7b197b3e6a3cf3fb3fc0b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 5f6c834b71..efdeb3bcca 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -264,8 +264,8 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "4.11.12"	if BR2_KERNEL_HEADERS_4_11
 	default "4.12.14"	if BR2_KERNEL_HEADERS_4_12
 	default "4.13.16"	if BR2_KERNEL_HEADERS_4_13
-	default "4.14.48"	if BR2_KERNEL_HEADERS_4_14
+	default "4.14.49"	if BR2_KERNEL_HEADERS_4_14
 	default "4.15.18"	if BR2_KERNEL_HEADERS_4_15
-	default "4.16.14"	if BR2_KERNEL_HEADERS_4_16
-	default "4.17"		if BR2_KERNEL_HEADERS_4_17
+	default "4.16.15"	if BR2_KERNEL_HEADERS_4_16
+	default "4.17.1"	if BR2_KERNEL_HEADERS_4_17
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
