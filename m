From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 2 Jul 2017 17:35:30 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] linux-headers: bump 4.{4,
	9, 11}.x series
Message-ID: <20170702153315.0EB4281EF5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=170d26ae9c295e097e779ada329fbd249153884d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

[Peter: drop 4.11.x bump]
Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 463e68d0581408caa9199a092c9fe8c000d9ed55)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 62f40b8..f4ebb72 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -222,7 +222,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.19.8"	if BR2_KERNEL_HEADERS_3_19
 	default "4.0.9"		if BR2_KERNEL_HEADERS_4_0
 	default "4.1.42"	if BR2_KERNEL_HEADERS_4_1
-	default "4.4.74"	if BR2_KERNEL_HEADERS_4_4
+	default "4.4.75"	if BR2_KERNEL_HEADERS_4_4
 	default "4.8.17"	if BR2_KERNEL_HEADERS_4_8
-	default "4.9.34"	if BR2_KERNEL_HEADERS_4_9
+	default "4.9.33"	if BR2_KERNEL_HEADERS_4_9
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
