From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 4 Mar 2016 17:07:59 +0100
Subject: [Buildroot] [git commit] linux-headers: bump 3.{10,
	14}.x and 4.4.x series
Message-ID: <20160304160920.728717FF69@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=46c248c674d0480e0c4af42a73738625da2928e9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 7aaed97..5c9eabe 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -210,9 +210,9 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "3.2.78"	if BR2_KERNEL_HEADERS_3_2
 	default "3.4.110"	if BR2_KERNEL_HEADERS_3_4
-	default "3.10.98"	if BR2_KERNEL_HEADERS_3_10
+	default "3.10.99"	if BR2_KERNEL_HEADERS_3_10
 	default "3.12.55"	if BR2_KERNEL_HEADERS_3_12
-	default "3.14.62"	if BR2_KERNEL_HEADERS_3_14
+	default "3.14.63"	if BR2_KERNEL_HEADERS_3_14
 	default "3.17.8"	if BR2_KERNEL_HEADERS_3_17
 	default "3.18.27"	if BR2_KERNEL_HEADERS_3_18
 	default "3.19.8"	if BR2_KERNEL_HEADERS_3_19
@@ -220,5 +220,5 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "4.1.18"	if BR2_KERNEL_HEADERS_4_1
 	default "4.2.8"		if BR2_KERNEL_HEADERS_4_2
 	default "4.3.6"		if BR2_KERNEL_HEADERS_4_3
-	default "4.4.3"		if BR2_KERNEL_HEADERS_4_4
+	default "4.4.4"		if BR2_KERNEL_HEADERS_4_4
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
