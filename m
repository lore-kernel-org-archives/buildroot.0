From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 29 Jan 2019 20:20:11 +0100
Subject: [Buildroot] [git commit branch/2018.02.x] {linux,
 linux-headers}: bump 4.{9, 14, 19, 20}.x series
Message-ID: <20190129191920.27F328151C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=67e3799b560b96d27fa24ed208da46838721553f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 9a76fd4dd6960b072bbb03911ee7662d86241d21)
[Peter: drop 4.19.x/4.20.x, linux / hash changes]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 5b3f311874..72d243ddfe 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -251,11 +251,11 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.2.102"	if BR2_KERNEL_HEADERS_3_2
 	default "4.1.52"	if BR2_KERNEL_HEADERS_4_1
 	default "4.4.171"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.151"	if BR2_KERNEL_HEADERS_4_9
+	default "4.9.152"	if BR2_KERNEL_HEADERS_4_9
 	default "4.10.17"	if BR2_KERNEL_HEADERS_4_10
 	default "4.11.12"	if BR2_KERNEL_HEADERS_4_11
 	default "4.12.14"	if BR2_KERNEL_HEADERS_4_12
 	default "4.13.16"	if BR2_KERNEL_HEADERS_4_13
-	default "4.14.94"	if BR2_KERNEL_HEADERS_4_14
+	default "4.14.95"	if BR2_KERNEL_HEADERS_4_14
 	default "4.15.18"	if BR2_KERNEL_HEADERS_4_15
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
