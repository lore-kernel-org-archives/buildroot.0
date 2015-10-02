From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 2 Oct 2015 12:12:11 +0200
Subject: [Buildroot] [git commit] linux-headers: bump 3.{10, 14}.x series
Message-ID: <20151002101214.E7C6981D5A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bcc8dd297a6d732362b844d4ed49b6aee7922df4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/linux-headers/Config.in.host |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 3559167..101f30d 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -193,9 +193,9 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "3.2.71"	if BR2_KERNEL_HEADERS_3_2
 	default "3.4.109"	if BR2_KERNEL_HEADERS_3_4
-	default "3.10.89"	if BR2_KERNEL_HEADERS_3_10
+	default "3.10.90"	if BR2_KERNEL_HEADERS_3_10
 	default "3.12.48"	if BR2_KERNEL_HEADERS_3_12
-	default "3.14.53"	if BR2_KERNEL_HEADERS_3_14
+	default "3.14.54"	if BR2_KERNEL_HEADERS_3_14
 	default "3.16.7"	if BR2_KERNEL_HEADERS_3_16
 	default "3.17.8"	if BR2_KERNEL_HEADERS_3_17
 	default "3.18.21"	if BR2_KERNEL_HEADERS_3_18
