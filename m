From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 31 Jan 2018 08:05:44 +0100
Subject: [Buildroot] [git commit branch/2017.02.x] linux-headers: bump 4.{4,
 9, 14}.x series
Message-ID: <20180131075150.6958988171@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0b7278edc8729da5af0c276e1d80187b22ff4459
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

[Peter: drop 4.14.x bump]
Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit f8fc447c20745bf851ceba8ac0963439103acb0e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 490106a82d..f6cda9a061 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -222,7 +222,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.19.8"	if BR2_KERNEL_HEADERS_3_19
 	default "4.0.9"		if BR2_KERNEL_HEADERS_4_0
 	default "4.1.48"	if BR2_KERNEL_HEADERS_4_1
-	default "4.4.111"	if BR2_KERNEL_HEADERS_4_4
+	default "4.4.112"	if BR2_KERNEL_HEADERS_4_4
 	default "4.8.17"	if BR2_KERNEL_HEADERS_4_8
-	default "4.9.76"	if BR2_KERNEL_HEADERS_4_9
+	default "4.9.77"	if BR2_KERNEL_HEADERS_4_9
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
