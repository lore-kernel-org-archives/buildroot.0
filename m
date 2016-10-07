From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 7 Oct 2016 22:34:25 +0200
Subject: [Buildroot] [git commit] linux-headers: bump 4.{4, 7, 8}.x series
Message-ID: <20161007203518.745A78082C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=aadb8b3bca814ca0e2dffb6cd1ba7b4d402a6f30
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index a07ed18..c0e7067 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -244,9 +244,9 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "4.1.32"	if BR2_KERNEL_HEADERS_4_1
 	default "4.2.8"		if BR2_KERNEL_HEADERS_4_2
 	default "4.3.6"		if BR2_KERNEL_HEADERS_4_3
-	default "4.4.23"	if BR2_KERNEL_HEADERS_4_4
+	default "4.4.24"	if BR2_KERNEL_HEADERS_4_4
 	default "4.5.7"		if BR2_KERNEL_HEADERS_4_5
 	default "4.6.7"		if BR2_KERNEL_HEADERS_4_6
-	default "4.7.6"		if BR2_KERNEL_HEADERS_4_7
-	default "4.8"		if BR2_KERNEL_HEADERS_4_8
+	default "4.7.7"		if BR2_KERNEL_HEADERS_4_7
+	default "4.8.1"		if BR2_KERNEL_HEADERS_4_8
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
