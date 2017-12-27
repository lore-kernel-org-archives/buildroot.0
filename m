From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 27 Dec 2017 23:38:04 +0100
Subject: [Buildroot] [git commit branch/2017.11.x] linux-headers: bump 4.{1,
 4, 9, 14}.x series
Message-ID: <20171227223844.0FB3D8376D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d78efce3ab5358bb99d364424ffd64d49117034e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.11.x

[Peter: drop 4.14.x bump]
Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 634bdbd52e7451b615b8972f0d3973e5b76ef987)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 866686d..c63495f 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -243,9 +243,9 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.4.113"	if BR2_KERNEL_HEADERS_3_4
 	default "3.10.108"	if BR2_KERNEL_HEADERS_3_10
 	default "3.12.74"	if BR2_KERNEL_HEADERS_3_12
-	default "4.1.47"	if BR2_KERNEL_HEADERS_4_1
-	default "4.4.107"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.71"	if BR2_KERNEL_HEADERS_4_9
+	default "4.1.48"	if BR2_KERNEL_HEADERS_4_1
+	default "4.4.108"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.72"	if BR2_KERNEL_HEADERS_4_9
 	default "4.10.17"	if BR2_KERNEL_HEADERS_4_10
 	default "4.11.12"	if BR2_KERNEL_HEADERS_4_11
 	default "4.12.14"	if BR2_KERNEL_HEADERS_4_12
