From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 27 Dec 2017 12:48:04 +0100
Subject: [Buildroot] [git commit branch/2017.11.x] linux-headers: bump 4.{4,
 9}.x series
Message-ID: <20171227114858.710AF83700@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5d65377ccae9dbdba8f716c16c4f547c53b9f651
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.11.x

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 1bc6f2d5cde30537b392d92601fe860c20a4d049)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 49d567e..ad7002a 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -244,8 +244,8 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.10.108"	if BR2_KERNEL_HEADERS_3_10
 	default "3.12.74"	if BR2_KERNEL_HEADERS_3_12
 	default "4.1.47"	if BR2_KERNEL_HEADERS_4_1
-	default "4.4.104"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.67"	if BR2_KERNEL_HEADERS_4_9
+	default "4.4.105"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.68"	if BR2_KERNEL_HEADERS_4_9
 	default "4.10.17"	if BR2_KERNEL_HEADERS_4_10
 	default "4.11.12"	if BR2_KERNEL_HEADERS_4_11
 	default "4.12.14"	if BR2_KERNEL_HEADERS_4_12
