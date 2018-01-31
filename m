From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 31 Jan 2018 12:58:32 +0100
Subject: [Buildroot] [git commit branch/2017.02.x] linux-headers: bump 4.{4,
 9, 14}.x series
Message-ID: <20180131123645.B4FC688170@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7204c26c1f0a5aac69807d2efbb2cbce239ab1cf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

[Peter: drop 4.14.x bump]
Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 770c19df08d56216f194367084d9e7254bd9a037)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 08beeb05bf..e2e71c34b4 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -222,7 +222,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.19.8"	if BR2_KERNEL_HEADERS_3_19
 	default "4.0.9"		if BR2_KERNEL_HEADERS_4_0
 	default "4.1.49"	if BR2_KERNEL_HEADERS_4_1
-	default "4.4.112"	if BR2_KERNEL_HEADERS_4_4
+	default "4.4.113"	if BR2_KERNEL_HEADERS_4_4
 	default "4.8.17"	if BR2_KERNEL_HEADERS_4_8
-	default "4.9.77"	if BR2_KERNEL_HEADERS_4_9
+	default "4.9.78"	if BR2_KERNEL_HEADERS_4_9
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
