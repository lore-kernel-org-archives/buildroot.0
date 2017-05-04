From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 4 May 2017 09:29:03 +0200
Subject: [Buildroot] [git commit] linux-headers: bump 4.{4,9,10}.x series
Message-ID: <20170504072922.C27FC8270B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=15a31470b0381fc0a77cafbc5ed63c8578a163ff
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index f75fac8..dcfcce9 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -227,8 +227,8 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.10.105"	if BR2_KERNEL_HEADERS_3_10
 	default "3.12.73"	if BR2_KERNEL_HEADERS_3_12
 	default "4.1.39"	if BR2_KERNEL_HEADERS_4_1
-	default "4.4.65"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.25"	if BR2_KERNEL_HEADERS_4_9
-	default "4.10.13"	if BR2_KERNEL_HEADERS_4_10
+	default "4.4.66"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.26"	if BR2_KERNEL_HEADERS_4_9
+	default "4.10.14"	if BR2_KERNEL_HEADERS_4_10
 	default "4.11"		if BR2_KERNEL_HEADERS_4_11
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
