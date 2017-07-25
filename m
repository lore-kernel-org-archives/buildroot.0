From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 25 Jul 2017 23:44:15 +0200
Subject: [Buildroot] [git commit branch/2017.05.x] linux-headers: bump 4.{4,
	9, 11, 12}.x series
Message-ID: <20170725222210.2A32882147@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0bcd6fa5d51c4715eef3f5bf33fd4bda54796426
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.05.x

[Peter: Drop 4.12.x bump]
Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 6e97747666a4e9b73fba332437a1b9a3f6472b1b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 8a74c00..a992b0d 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -227,8 +227,8 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.10.106"	if BR2_KERNEL_HEADERS_3_10
 	default "3.12.74"	if BR2_KERNEL_HEADERS_3_12
 	default "4.1.42"	if BR2_KERNEL_HEADERS_4_1
-	default "4.4.77"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.38"	if BR2_KERNEL_HEADERS_4_9
+	default "4.4.78"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.39"	if BR2_KERNEL_HEADERS_4_9
 	default "4.10.17"	if BR2_KERNEL_HEADERS_4_10
-	default "4.11.11"	if BR2_KERNEL_HEADERS_4_11
+	default "4.11.12"	if BR2_KERNEL_HEADERS_4_11
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
