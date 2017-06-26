From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Jun 2017 22:27:49 +0200
Subject: [Buildroot] [git commit branch/2017.05.x] linux-headers: bump 4.4.x
	series
Message-ID: <20170626202759.2FA7F807A1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=096f4b70a6095b484cd6f16a682e087f1c2bb3ce
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.05.x

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 13e4c459140adf621f0ed3f29efbde718918b048)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index a29cd30..613a26e 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -227,7 +227,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.10.106"	if BR2_KERNEL_HEADERS_3_10
 	default "3.12.74"	if BR2_KERNEL_HEADERS_3_12
 	default "4.1.41"	if BR2_KERNEL_HEADERS_4_1
-	default "4.4.73"	if BR2_KERNEL_HEADERS_4_4
+	default "4.4.74"	if BR2_KERNEL_HEADERS_4_4
 	default "4.9.34"	if BR2_KERNEL_HEADERS_4_9
 	default "4.10.17"	if BR2_KERNEL_HEADERS_4_10
 	default "4.11.7"	if BR2_KERNEL_HEADERS_4_11
