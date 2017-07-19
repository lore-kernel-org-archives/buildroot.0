From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 19 Jul 2017 16:10:08 +0200
Subject: [Buildroot] [git commit branch/2017.05.x] linux-headers: bump 4.{9,
	11, 12}.x series
Message-ID: <20170719204759.AB3A381D8D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ea9c1a8be8590653bd5261eb2686af7bca9d77c7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.05.x

[Drop 4.12.x change]
Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 8e95c2e9ca72d39823a0ef72c69590da0ca8b140)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index be0799b..19ebbb8 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -228,7 +228,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.12.74"	if BR2_KERNEL_HEADERS_3_12
 	default "4.1.42"	if BR2_KERNEL_HEADERS_4_1
 	default "4.4.76"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.36"	if BR2_KERNEL_HEADERS_4_9
+	default "4.9.37"	if BR2_KERNEL_HEADERS_4_9
 	default "4.10.17"	if BR2_KERNEL_HEADERS_4_10
-	default "4.11.9"	if BR2_KERNEL_HEADERS_4_11
+	default "4.11.10"	if BR2_KERNEL_HEADERS_4_11
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
