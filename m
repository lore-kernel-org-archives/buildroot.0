From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 10 Mar 2016 15:05:27 +0100
Subject: [Buildroot] [git commit] linux-headers: bump 3.{10,
	14}.x and 4.4.x series
Message-ID: <20160310144157.5606C81D2A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a783addfe690708ad72b43f8f91b9be754073391
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 74ba8bd..f847720 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -210,9 +210,9 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "3.2.78"	if BR2_KERNEL_HEADERS_3_2
 	default "3.4.110"	if BR2_KERNEL_HEADERS_3_4
-	default "3.10.99"	if BR2_KERNEL_HEADERS_3_10
+	default "3.10.100"	if BR2_KERNEL_HEADERS_3_10
 	default "3.12.56"	if BR2_KERNEL_HEADERS_3_12
-	default "3.14.63"	if BR2_KERNEL_HEADERS_3_14
+	default "3.14.64"	if BR2_KERNEL_HEADERS_3_14
 	default "3.17.8"	if BR2_KERNEL_HEADERS_3_17
 	default "3.18.28"	if BR2_KERNEL_HEADERS_3_18
 	default "3.19.8"	if BR2_KERNEL_HEADERS_3_19
@@ -220,5 +220,5 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "4.1.19"	if BR2_KERNEL_HEADERS_4_1
 	default "4.2.8"		if BR2_KERNEL_HEADERS_4_2
 	default "4.3.6"		if BR2_KERNEL_HEADERS_4_3
-	default "4.4.4"		if BR2_KERNEL_HEADERS_4_4
+	default "4.4.5"		if BR2_KERNEL_HEADERS_4_4
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
