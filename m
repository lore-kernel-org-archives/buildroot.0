From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 21 Jan 2018 21:15:50 +0100
Subject: [Buildroot] [git commit branch/2017.11.x] linux-headers: bump 4.{4,
 9, 14}.x series
Message-ID: <20180121210851.33E3283DF0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=71c80c0b690a4adfe298ebb581e81791cc831edc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.11.x

[Peter: drop 4.14.x bump]
Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit f8fc447c20745bf851ceba8ac0963439103acb0e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index af774cb..9a4e254 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -244,8 +244,8 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.10.108"	if BR2_KERNEL_HEADERS_3_10
 	default "3.12.74"	if BR2_KERNEL_HEADERS_3_12
 	default "4.1.48"	if BR2_KERNEL_HEADERS_4_1
-	default "4.4.111"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.76"	if BR2_KERNEL_HEADERS_4_9
+	default "4.4.112"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.77"	if BR2_KERNEL_HEADERS_4_9
 	default "4.10.17"	if BR2_KERNEL_HEADERS_4_10
 	default "4.11.12"	if BR2_KERNEL_HEADERS_4_11
 	default "4.12.14"	if BR2_KERNEL_HEADERS_4_12
