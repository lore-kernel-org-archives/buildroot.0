From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 25 Oct 2017 09:38:42 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] linux-headers: bump 4.{1,
	4, 9, 13}.x series
Message-ID: <20171025073527.298547F969@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e8af016894c7c1a5ddc6fd947e0ecd83032f6f23
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

[Peter: drop 4.13.x bump]
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 60e3da602d3d5b017b5176848abcba92866df3f3)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index cb1a2e4..642bc8c 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -221,8 +221,8 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.18.72"	if BR2_KERNEL_HEADERS_3_18
 	default "3.19.8"	if BR2_KERNEL_HEADERS_3_19
 	default "4.0.9"		if BR2_KERNEL_HEADERS_4_0
-	default "4.1.44"	if BR2_KERNEL_HEADERS_4_1
-	default "4.4.92"	if BR2_KERNEL_HEADERS_4_4
+	default "4.1.45"	if BR2_KERNEL_HEADERS_4_1
+	default "4.4.93"	if BR2_KERNEL_HEADERS_4_4
 	default "4.8.17"	if BR2_KERNEL_HEADERS_4_8
-	default "4.9.56"	if BR2_KERNEL_HEADERS_4_9
+	default "4.9.57"	if BR2_KERNEL_HEADERS_4_9
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
