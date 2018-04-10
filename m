From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 10 Apr 2018 21:43:00 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] linux-headers: bump 4.{9,
 14}.x series
Message-ID: <20180410205256.2D096807C8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9c908557caf467f78042f008912420f7729089ad
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

[Peter: drop 4.14.x bump]
Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 7c084582701542e7a5b87561c4e142cf86ec8873)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 2f14fceb48..ecd474a0a5 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -224,5 +224,5 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "4.1.49"	if BR2_KERNEL_HEADERS_4_1
 	default "4.4.115"	if BR2_KERNEL_HEADERS_4_4
 	default "4.8.17"	if BR2_KERNEL_HEADERS_4_8
-	default "4.9.80"	if BR2_KERNEL_HEADERS_4_9
+	default "4.9.81"	if BR2_KERNEL_HEADERS_4_9
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
