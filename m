From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 27 Dec 2016 23:35:44 +0100
Subject: [Buildroot] [git commit] linux-headers: bump 3.18.x and 4.1.x series
Message-ID: <20161227223947.9BC4580178@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c7bdef0d23ee9d06b7dd7dbcb72d52a2bbb149e4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 4ab562c..967dfad 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -218,10 +218,10 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.4.113"	if BR2_KERNEL_HEADERS_3_4
 	default "3.10.104"	if BR2_KERNEL_HEADERS_3_10
 	default "3.12.69"	if BR2_KERNEL_HEADERS_3_12
-	default "3.18.45"	if BR2_KERNEL_HEADERS_3_18
+	default "3.18.46"	if BR2_KERNEL_HEADERS_3_18
 	default "3.19.8"	if BR2_KERNEL_HEADERS_3_19
 	default "4.0.9"		if BR2_KERNEL_HEADERS_4_0
-	default "4.1.36"	if BR2_KERNEL_HEADERS_4_1
+	default "4.1.37"	if BR2_KERNEL_HEADERS_4_1
 	default "4.4.39"	if BR2_KERNEL_HEADERS_4_4
 	default "4.8.15"	if BR2_KERNEL_HEADERS_4_8
 	default "4.9"		if BR2_KERNEL_HEADERS_4_9
