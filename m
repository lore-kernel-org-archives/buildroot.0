From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 31 Dec 2017 00:03:46 +0100
Subject: [Buildroot] [git commit branch/2017.02.x] linux-headers: bump 4.{4,
 9}.x series
Message-ID: <20171230230909.EDF3B836BF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6bac73c46786b4d1700143bc1c3e2031e31e05f0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 06bbe7f7b8d1f1eac7e1663ce3d21373afb051ed)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 49707f6..b5bdc94 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -222,7 +222,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.19.8"	if BR2_KERNEL_HEADERS_3_19
 	default "4.0.9"		if BR2_KERNEL_HEADERS_4_0
 	default "4.1.47"	if BR2_KERNEL_HEADERS_4_1
-	default "4.4.105"	if BR2_KERNEL_HEADERS_4_4
+	default "4.4.106"	if BR2_KERNEL_HEADERS_4_4
 	default "4.8.17"	if BR2_KERNEL_HEADERS_4_8
-	default "4.9.69"	if BR2_KERNEL_HEADERS_4_9
+	default "4.9.70"	if BR2_KERNEL_HEADERS_4_9
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
