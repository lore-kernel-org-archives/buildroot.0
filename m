From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 19 Jul 2018 23:47:52 +0200
Subject: [Buildroot] [git commit branch/2018.05.x] linux-headers: bump 4.{4,
 9}.x series
Message-ID: <20180719214653.D6519890F8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8d469c7d55463b7a7e41ea42b50de03260cdcb16
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.05.x

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 78117a553b4734ab810e218d8e3355f12d6889ee)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 7e59265627..a82f7a0aa7 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -250,8 +250,8 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "3.2.102"	if BR2_KERNEL_HEADERS_3_2
 	default "4.1.52"	if BR2_KERNEL_HEADERS_4_1
-	default "4.4.136"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.107"	if BR2_KERNEL_HEADERS_4_9
+	default "4.4.137"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.108"	if BR2_KERNEL_HEADERS_4_9
 	default "4.10.17"	if BR2_KERNEL_HEADERS_4_10
 	default "4.11.12"	if BR2_KERNEL_HEADERS_4_11
 	default "4.12.14"	if BR2_KERNEL_HEADERS_4_12
