From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 26 Jul 2017 00:08:14 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] linux-headers: bump 4.{4,
	9, 11, 12}.x series
Message-ID: <20170725222141.E9E257FBDC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=85460f118e7ab138f5cda01c30e868d3ea7c6f93
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

[Peter: Drop 4.11.x/4.12.x bump]
Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 6e97747666a4e9b73fba332437a1b9a3f6472b1b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 6b6b6ea..99c8b2a 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -222,7 +222,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.19.8"	if BR2_KERNEL_HEADERS_3_19
 	default "4.0.9"		if BR2_KERNEL_HEADERS_4_0
 	default "4.1.42"	if BR2_KERNEL_HEADERS_4_1
-	default "4.4.77"	if BR2_KERNEL_HEADERS_4_4
+	default "4.4.78"	if BR2_KERNEL_HEADERS_4_4
 	default "4.8.17"	if BR2_KERNEL_HEADERS_4_8
-	default "4.9.38"	if BR2_KERNEL_HEADERS_4_9
+	default "4.9.39"	if BR2_KERNEL_HEADERS_4_9
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
