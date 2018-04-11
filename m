From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 11 Apr 2018 16:43:55 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] linux-headers: bump 4.{4,
 9}.x series
Message-ID: <20180411154834.6BE0688454@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f971d57e1cd28ba3beea526332a227eba27af5fa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 50cd46b39f4af495a4c9d15f0e5d3df272e33c7c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 342d45afd1..e6f5ce3160 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -222,7 +222,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.19.8"	if BR2_KERNEL_HEADERS_3_19
 	default "4.0.9"		if BR2_KERNEL_HEADERS_4_0
 	default "4.1.49"	if BR2_KERNEL_HEADERS_4_1
-	default "4.4.121"	if BR2_KERNEL_HEADERS_4_4
+	default "4.4.122"	if BR2_KERNEL_HEADERS_4_4
 	default "4.8.17"	if BR2_KERNEL_HEADERS_4_8
-	default "4.9.87"	if BR2_KERNEL_HEADERS_4_9
+	default "4.9.88"	if BR2_KERNEL_HEADERS_4_9
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
