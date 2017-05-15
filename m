From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 15 May 2017 17:59:16 +0200
Subject: [Buildroot] [git commit] linux-headers: bump 4.{4, 9, 10,
	11}.x series
Message-ID: <20170515155956.4713E828A6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5879cc71dd048472d2da85b7cbafd884f275bcc4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index f851271..014ae70 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -227,8 +227,8 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.10.105"	if BR2_KERNEL_HEADERS_3_10
 	default "3.12.74"	if BR2_KERNEL_HEADERS_3_12
 	default "4.1.39"	if BR2_KERNEL_HEADERS_4_1
-	default "4.4.67"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.27"	if BR2_KERNEL_HEADERS_4_9
-	default "4.10.15"	if BR2_KERNEL_HEADERS_4_10
-	default "4.11"		if BR2_KERNEL_HEADERS_4_11
+	default "4.4.68"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.28"	if BR2_KERNEL_HEADERS_4_9
+	default "4.10.16"	if BR2_KERNEL_HEADERS_4_10
+	default "4.11.1"	if BR2_KERNEL_HEADERS_4_11
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
