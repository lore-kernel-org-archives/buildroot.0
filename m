From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 18 Oct 2016 22:15:35 +0200
Subject: [Buildroot] [git commit] linux-headers: bump 4.{4, 7, 8}.x series
Message-ID: <20161018202210.A39C97FC1B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6d9791f059a404ad9d99f6823420a442a4c80241
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 60578b8..759959f 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -232,9 +232,9 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.19.8"	if BR2_KERNEL_HEADERS_3_19
 	default "4.0.9"		if BR2_KERNEL_HEADERS_4_0
 	default "4.1.34"	if BR2_KERNEL_HEADERS_4_1
-	default "4.4.24"	if BR2_KERNEL_HEADERS_4_4
+	default "4.4.25"	if BR2_KERNEL_HEADERS_4_4
 	default "4.5.7"		if BR2_KERNEL_HEADERS_4_5
 	default "4.6.7"		if BR2_KERNEL_HEADERS_4_6
-	default "4.7.7"		if BR2_KERNEL_HEADERS_4_7
-	default "4.8.1"		if BR2_KERNEL_HEADERS_4_8
+	default "4.7.8"		if BR2_KERNEL_HEADERS_4_7
+	default "4.8.2"		if BR2_KERNEL_HEADERS_4_8
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
