From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 9 Jan 2017 11:42:07 +0100
Subject: [Buildroot] [git commit] linux-headers: bump 4.{4, 8, 9}.x series
Message-ID: <20170109104338.A91537F8C8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c09ca7ba4fc372b63b9b619ab358d11f572ac0f5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index e96d45d..555b15a 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -222,7 +222,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.19.8"	if BR2_KERNEL_HEADERS_3_19
 	default "4.0.9"		if BR2_KERNEL_HEADERS_4_0
 	default "4.1.37"	if BR2_KERNEL_HEADERS_4_1
-	default "4.4.40"	if BR2_KERNEL_HEADERS_4_4
-	default "4.8.16"	if BR2_KERNEL_HEADERS_4_8
-	default "4.9.1"		if BR2_KERNEL_HEADERS_4_9
+	default "4.4.41"	if BR2_KERNEL_HEADERS_4_4
+	default "4.8.17"	if BR2_KERNEL_HEADERS_4_8
+	default "4.9.2"		if BR2_KERNEL_HEADERS_4_9
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
