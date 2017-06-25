From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Jun 2017 00:27:57 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] linux-headers: bump 4.{1,
	4, 9, 11}.x series
Message-ID: <20170625223454.E28617FB03@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f1bbfaa4eb7041d59135dbeb43ab5739b992d8c0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

[Peter: drop 4.11.x bump]
Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 859764ac39c18c6aaabbb6a1a47f2fa2e5793044)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 603f6ee..0d67d92 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -221,8 +221,8 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.18.57"	if BR2_KERNEL_HEADERS_3_18
 	default "3.19.8"	if BR2_KERNEL_HEADERS_3_19
 	default "4.0.9"		if BR2_KERNEL_HEADERS_4_0
-	default "4.1.40"	if BR2_KERNEL_HEADERS_4_1
-	default "4.4.72"	if BR2_KERNEL_HEADERS_4_4
+	default "4.1.41"	if BR2_KERNEL_HEADERS_4_1
+	default "4.4.73"	if BR2_KERNEL_HEADERS_4_4
 	default "4.8.17"	if BR2_KERNEL_HEADERS_4_8
-	default "4.9.32"	if BR2_KERNEL_HEADERS_4_9
+	default "4.9.33"	if BR2_KERNEL_HEADERS_4_9
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
