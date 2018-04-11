From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 11 Apr 2018 17:20:51 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] linux-headers: bump 4.{1,
 4, 9, 14, 15}.x series
Message-ID: <20180411154835.56EF688454@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3d5be0c7152f679c3577a994a79b384999133658
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

[Peter: drop 4.14.x / 4.15.x bump]
Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 9ef8f6b061b552012b767b83c7b21e5e3fb9fff7)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index db7a436e04..410e21cb23 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -221,8 +221,8 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.18.72"	if BR2_KERNEL_HEADERS_3_18
 	default "3.19.8"	if BR2_KERNEL_HEADERS_3_19
 	default "4.0.9"		if BR2_KERNEL_HEADERS_4_0
-	default "4.1.50"	if BR2_KERNEL_HEADERS_4_1
-	default "4.4.124"	if BR2_KERNEL_HEADERS_4_4
+	default "4.1.51"	if BR2_KERNEL_HEADERS_4_1
+	default "4.4.125"	if BR2_KERNEL_HEADERS_4_4
 	default "4.8.17"	if BR2_KERNEL_HEADERS_4_8
-	default "4.9.90"	if BR2_KERNEL_HEADERS_4_9
+	default "4.9.91"	if BR2_KERNEL_HEADERS_4_9
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
