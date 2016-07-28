From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 28 Jul 2016 21:52:05 +0200
Subject: [Buildroot] [git commit] linux-headers: bump 3.14.x and 4.{4,
	6}.x series
Message-ID: <20160728201546.6AE6A7FDA3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d2a14b53154f59b69ff1fdf796e53376307450ba
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 2ad9ada..089d424 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -239,15 +239,15 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.4.112"	if BR2_KERNEL_HEADERS_3_4
 	default "3.10.102"	if BR2_KERNEL_HEADERS_3_10
 	default "3.12.62"	if BR2_KERNEL_HEADERS_3_12
-	default "3.14.73"	if BR2_KERNEL_HEADERS_3_14
+	default "3.14.74"	if BR2_KERNEL_HEADERS_3_14
 	default "3.18.37"	if BR2_KERNEL_HEADERS_3_18
 	default "3.19.8"	if BR2_KERNEL_HEADERS_3_19
 	default "4.0.9"		if BR2_KERNEL_HEADERS_4_0
 	default "4.1.28"	if BR2_KERNEL_HEADERS_4_1
 	default "4.2.8"		if BR2_KERNEL_HEADERS_4_2
 	default "4.3.6"		if BR2_KERNEL_HEADERS_4_3
-	default "4.4.15"	if BR2_KERNEL_HEADERS_4_4
+	default "4.4.16"	if BR2_KERNEL_HEADERS_4_4
 	default "4.5.7"		if BR2_KERNEL_HEADERS_4_5
-	default "4.6.4"		if BR2_KERNEL_HEADERS_4_6
+	default "4.6.5"		if BR2_KERNEL_HEADERS_4_6
 	default "4.7"		if BR2_KERNEL_HEADERS_4_7
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
