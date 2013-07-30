From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 30 Jul 2013 23:27:46 +0200
Subject: [Buildroot] [git commit] linux-headers: bump 3.{0, 4,
	10}.x stable versions
Message-ID: <20130730212952.B41F79AEBA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e51810d8b0a02ea9c3df06ce8e469bc2f45b874e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...tall-fix-__packed-in-exported-kernel-head.patch |    0
 package/linux-headers/Config.in.host               |    6 +++---
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/linux-headers/3.0.87/linux-headers-headers_install-fix-__packed-in-exported-kernel-head.patch b/package/linux-headers/3.0.88/linux-headers-headers_install-fix-__packed-in-exported-kernel-head.patch
similarity index 100%
rename from package/linux-headers/3.0.87/linux-headers-headers_install-fix-__packed-in-exported-kernel-head.patch
rename to package/linux-headers/3.0.88/linux-headers-headers_install-fix-__packed-in-exported-kernel-head.patch
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 7a61b55..4380e2d 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -72,16 +72,16 @@ config BR2_DEFAULT_KERNEL_VERSION
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "3.0.87"	if BR2_KERNEL_HEADERS_3_0
+	default "3.0.88"	if BR2_KERNEL_HEADERS_3_0
 	default "3.1.10"	if BR2_KERNEL_HEADERS_3_1
 	default "3.2.49"	if BR2_KERNEL_HEADERS_3_2
 	default "3.3.8"		if BR2_KERNEL_HEADERS_3_3
-	default "3.4.54"	if BR2_KERNEL_HEADERS_3_4
+	default "3.4.55"	if BR2_KERNEL_HEADERS_3_4
 	default "3.5.7"		if BR2_KERNEL_HEADERS_3_5
 	default "3.6.11"	if BR2_KERNEL_HEADERS_3_6
 	default "3.7.10"	if BR2_KERNEL_HEADERS_3_7
 	default "3.8.13"	if BR2_KERNEL_HEADERS_3_8
 	default "3.9.11"	if BR2_KERNEL_HEADERS_3_9
-	default "3.10.3"	if BR2_KERNEL_HEADERS_3_10
+	default "3.10.4"	if BR2_KERNEL_HEADERS_3_10
 	default "2.6"		if BR2_KERNEL_HEADERS_SNAP
 	default $BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
