From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 30 Apr 2018 23:06:01 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] linux-headers: bump 4.9.x
 series
Message-ID: <20180501073416.ABAA3890BC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=30a8aab5593c2060447e4f38aa2aec4a61971fe6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 26148a247f3757b0ee7f24b10f13c0451f25a9ae)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 800c33dc23..3e2bbf10aa 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -243,7 +243,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.2.101"	if BR2_KERNEL_HEADERS_3_2
 	default "4.1.51"	if BR2_KERNEL_HEADERS_4_1
 	default "4.4.128"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.94"	if BR2_KERNEL_HEADERS_4_9
+	default "4.9.95"	if BR2_KERNEL_HEADERS_4_9
 	default "4.10.17"	if BR2_KERNEL_HEADERS_4_10
 	default "4.11.12"	if BR2_KERNEL_HEADERS_4_11
 	default "4.12.14"	if BR2_KERNEL_HEADERS_4_12
