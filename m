From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 8 Jan 2018 22:34:35 +0100
Subject: [Buildroot] [git commit branch/2017.11.x] linux-headers: bump 4.{4,
 9, 14}.x series
Message-ID: <20180108215441.BE1E0803A7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f68d0751541e28b775dc75e57283599baa68cdbe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.11.x

[Peter: drop 4.14.x bump]
Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 7f02b4ae4525cdfb2a67286f982264c7de1e73dc)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 43728dc..a1a7eb3 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -244,8 +244,8 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.10.108"	if BR2_KERNEL_HEADERS_3_10
 	default "3.12.74"	if BR2_KERNEL_HEADERS_3_12
 	default "4.1.48"	if BR2_KERNEL_HEADERS_4_1
-	default "4.4.109"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.74"	if BR2_KERNEL_HEADERS_4_9
+	default "4.4.110"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.75"	if BR2_KERNEL_HEADERS_4_9
 	default "4.10.17"	if BR2_KERNEL_HEADERS_4_10
 	default "4.11.12"	if BR2_KERNEL_HEADERS_4_11
 	default "4.12.14"	if BR2_KERNEL_HEADERS_4_12
