From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 6 Apr 2018 16:38:52 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] linux-headers: bump 4.{4,
 9}.x series
Message-ID: <20180406165913.0128B83E91@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=df2b54974ebacc501c8d7999e802203a80eb7c88
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 50cd46b39f4af495a4c9d15f0e5d3df272e33c7c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index fd82049fe9..3b0bf84de1 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -242,8 +242,8 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "3.2.99"	if BR2_KERNEL_HEADERS_3_2
 	default "4.1.49"	if BR2_KERNEL_HEADERS_4_1
-	default "4.4.121"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.87"	if BR2_KERNEL_HEADERS_4_9
+	default "4.4.122"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.88"	if BR2_KERNEL_HEADERS_4_9
 	default "4.10.17"	if BR2_KERNEL_HEADERS_4_10
 	default "4.11.12"	if BR2_KERNEL_HEADERS_4_11
 	default "4.12.14"	if BR2_KERNEL_HEADERS_4_12
