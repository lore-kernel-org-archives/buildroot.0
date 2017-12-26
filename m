From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 26 Dec 2017 19:47:29 +0100
Subject: [Buildroot] [git commit] linux-headers: bump 4.{1, 4, 9,
 14}.x series
Message-ID: <20171226184751.5C23483651@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=634bdbd52e7451b615b8972f0d3973e5b76ef987
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index b86f6c5..9d7fae5 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -251,12 +251,12 @@ config BR2_DEFAULT_KERNEL_HEADERS
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
 	default "4.13.16"	if BR2_KERNEL_HEADERS_4_13
-	default "4.14.8"	if BR2_KERNEL_HEADERS_4_14
+	default "4.14.9"	if BR2_KERNEL_HEADERS_4_14
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
