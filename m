From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Jun 2017 22:15:59 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] linux-headers: bump
	3.10.x and 4.{9, 11}.x series
Message-ID: <20170626202409.7BB3C801B2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f7cf42743c42bf8738d513cf69c42fdef309c420
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

[Peter: drop 4.11.x bump]
Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 2ad8f6643d9cc0a5d39656e119237e31adaf2c69)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 0d67d92..40e8587 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -216,7 +216,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "3.2.89"	if BR2_KERNEL_HEADERS_3_2
 	default "3.4.113"	if BR2_KERNEL_HEADERS_3_4
-	default "3.10.105"	if BR2_KERNEL_HEADERS_3_10
+	default "3.10.106"	if BR2_KERNEL_HEADERS_3_10
 	default "3.12.74"	if BR2_KERNEL_HEADERS_3_12
 	default "3.18.57"	if BR2_KERNEL_HEADERS_3_18
 	default "3.19.8"	if BR2_KERNEL_HEADERS_3_19
@@ -224,5 +224,5 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "4.1.41"	if BR2_KERNEL_HEADERS_4_1
 	default "4.4.73"	if BR2_KERNEL_HEADERS_4_4
 	default "4.8.17"	if BR2_KERNEL_HEADERS_4_8
-	default "4.9.33"	if BR2_KERNEL_HEADERS_4_9
+	default "4.9.34"	if BR2_KERNEL_HEADERS_4_9
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
