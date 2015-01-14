From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 14 Jan 2015 19:25:46 +0100
Subject: [Buildroot] [git commit] linux-headers: bump 3.12.x series
Message-ID: <20150114182636.4D91280809@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6952e32f37ea58e3861f89fc687c230c3d4742d1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/linux-headers/Config.in.host |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 23bb201..f4f80d1 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -176,7 +176,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.4.105"	if BR2_KERNEL_HEADERS_3_4
 	default "3.10.64"	if BR2_KERNEL_HEADERS_3_10
 	default "3.11.10"	if BR2_KERNEL_HEADERS_3_11
-	default "3.12.35"	if BR2_KERNEL_HEADERS_3_12
+	default "3.12.36"	if BR2_KERNEL_HEADERS_3_12
 	default "3.13.11"	if BR2_KERNEL_HEADERS_3_13
 	default "3.14.28"	if BR2_KERNEL_HEADERS_3_14
 	default "3.15.10"	if BR2_KERNEL_HEADERS_3_15
