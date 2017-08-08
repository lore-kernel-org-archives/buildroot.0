From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 8 Aug 2017 17:48:09 +0200
Subject: [Buildroot] [git commit] linux-headers: bump 4.{4, 9, 12}.x series
Message-ID: <20170808155050.959FC80819@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a4a6c74171d2411fa95d92ce489582b3f10ba705
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/linux-headers/Config.in.host | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 6f11fcc..9cf6fed 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -236,9 +236,9 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.10.106"	if BR2_KERNEL_HEADERS_3_10
 	default "3.12.74"	if BR2_KERNEL_HEADERS_3_12
 	default "4.1.43"	if BR2_KERNEL_HEADERS_4_1
-	default "4.4.79"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.40"	if BR2_KERNEL_HEADERS_4_9
+	default "4.4.80"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.41"	if BR2_KERNEL_HEADERS_4_9
 	default "4.10.17"	if BR2_KERNEL_HEADERS_4_10
 	default "4.11.12"	if BR2_KERNEL_HEADERS_4_11
-	default "4.12.4"	if BR2_KERNEL_HEADERS_4_12
+	default "4.12.5"	if BR2_KERNEL_HEADERS_4_12
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
