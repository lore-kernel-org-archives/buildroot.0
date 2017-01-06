From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 6 Jan 2017 14:46:48 +0100
Subject: [Buildroot] [git commit] linux-headers: bump 4.{4, 8, 9}.x series
Message-ID: <20170106134703.987AD81EA2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=59d699c7fad66d08a5f61147e3adc2d418db6479
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 967dfad..e96d45d 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -222,7 +222,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.19.8"	if BR2_KERNEL_HEADERS_3_19
 	default "4.0.9"		if BR2_KERNEL_HEADERS_4_0
 	default "4.1.37"	if BR2_KERNEL_HEADERS_4_1
-	default "4.4.39"	if BR2_KERNEL_HEADERS_4_4
-	default "4.8.15"	if BR2_KERNEL_HEADERS_4_8
-	default "4.9"		if BR2_KERNEL_HEADERS_4_9
+	default "4.4.40"	if BR2_KERNEL_HEADERS_4_4
+	default "4.8.16"	if BR2_KERNEL_HEADERS_4_8
+	default "4.9.1"		if BR2_KERNEL_HEADERS_4_9
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
