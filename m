From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 24 Apr 2014 13:42:31 +0200
Subject: [Buildroot] [git commit] linux-headers: bump 3.{12,13}.x series
Message-ID: <20140424114303.840A79C9CB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ed32ed86cb784f0e17a88d275702a5c65334714b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 23586fb..001c424 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -163,7 +163,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.9.11"	if BR2_KERNEL_HEADERS_3_9
 	default "3.10.37"	if BR2_KERNEL_HEADERS_3_10
 	default "3.11.10"	if BR2_KERNEL_HEADERS_3_11
-	default "3.12.17"	if BR2_KERNEL_HEADERS_3_12
-	default "3.13.10"	if BR2_KERNEL_HEADERS_3_13
+	default "3.12.18"	if BR2_KERNEL_HEADERS_3_12
+	default "3.13.11"	if BR2_KERNEL_HEADERS_3_13
 	default "3.14.1"	if BR2_KERNEL_HEADERS_3_14
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
