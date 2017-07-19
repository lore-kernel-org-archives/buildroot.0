From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 20 Jul 2017 00:15:06 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] linux-headers: bump 4.{9,
	11, 12}.x series
Message-ID: <20170720055508.C58E9800CC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=055a6b24aab9ee3b09516c44affb569dd4f9d265
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

[Drop 4.11.x/4.12.x change]
Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 8e95c2e9ca72d39823a0ef72c69590da0ca8b140)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index db4e18f..eea8909 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -224,5 +224,5 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "4.1.42"	if BR2_KERNEL_HEADERS_4_1
 	default "4.4.76"	if BR2_KERNEL_HEADERS_4_4
 	default "4.8.17"	if BR2_KERNEL_HEADERS_4_8
-	default "4.9.36"	if BR2_KERNEL_HEADERS_4_9
+	default "4.9.37"	if BR2_KERNEL_HEADERS_4_9
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
