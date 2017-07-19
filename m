From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 19 Jul 2017 19:46:50 +0200
Subject: [Buildroot] [git commit branch/2017.05.x] linux-headers: bump 4.{4,
	9, 11, 12}.x series
Message-ID: <20170719204800.B451E81D8D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ebc2dbc6b08d863b621b61fec9f39ed5e8a0c4f2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.05.x

[Peter: Drop 4.12.x bump]
Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit a78c0935d90e10d140326b2757471b16ff8462ca)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 19ebbb8..8a74c00 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -227,8 +227,8 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.10.106"	if BR2_KERNEL_HEADERS_3_10
 	default "3.12.74"	if BR2_KERNEL_HEADERS_3_12
 	default "4.1.42"	if BR2_KERNEL_HEADERS_4_1
-	default "4.4.76"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.37"	if BR2_KERNEL_HEADERS_4_9
+	default "4.4.77"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.38"	if BR2_KERNEL_HEADERS_4_9
 	default "4.10.17"	if BR2_KERNEL_HEADERS_4_10
-	default "4.11.10"	if BR2_KERNEL_HEADERS_4_11
+	default "4.11.11"	if BR2_KERNEL_HEADERS_4_11
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
