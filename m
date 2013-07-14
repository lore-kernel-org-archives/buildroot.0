From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 14 Jul 2013 21:02:19 +0200
Subject: [Buildroot] [git commit] linux-headers: bump 3.{0, 2, 4, 9,
	10}.x stable versions
Message-ID: <20130714194812.B93B29A4AA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bee9b328812a37ed8fe1552f70ceb0910ff72532
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 ...tall-fix-__packed-in-exported-kernel-head.patch |    0
 package/linux-headers/Config.in.host               |   10 +++++-----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/linux-headers/3.0.85/linux-headers-headers_install-fix-__packed-in-exported-kernel-head.patch b/package/linux-headers/3.0.86/linux-headers-headers_install-fix-__packed-in-exported-kernel-head.patch
similarity index 100%
rename from package/linux-headers/3.0.85/linux-headers-headers_install-fix-__packed-in-exported-kernel-head.patch
rename to package/linux-headers/3.0.86/linux-headers-headers_install-fix-__packed-in-exported-kernel-head.patch
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 8431b2d..a872445 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -72,16 +72,16 @@ config BR2_DEFAULT_KERNEL_VERSION
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "3.0.85"	if BR2_KERNEL_HEADERS_3_0
+	default "3.0.86"	if BR2_KERNEL_HEADERS_3_0
 	default "3.1.10"	if BR2_KERNEL_HEADERS_3_1
-	default "3.2.47"	if BR2_KERNEL_HEADERS_3_2
+	default "3.2.48"	if BR2_KERNEL_HEADERS_3_2
 	default "3.3.8"		if BR2_KERNEL_HEADERS_3_3
-	default "3.4.52"	if BR2_KERNEL_HEADERS_3_4
+	default "3.4.53"	if BR2_KERNEL_HEADERS_3_4
 	default "3.5.7"		if BR2_KERNEL_HEADERS_3_5
 	default "3.6.11"	if BR2_KERNEL_HEADERS_3_6
 	default "3.7.10"	if BR2_KERNEL_HEADERS_3_7
 	default "3.8.13"	if BR2_KERNEL_HEADERS_3_8
-	default "3.9.9"		if BR2_KERNEL_HEADERS_3_9
-	default "3.10"		if BR2_KERNEL_HEADERS_3_10
+	default "3.9.10"	if BR2_KERNEL_HEADERS_3_9
+	default "3.10.1"	if BR2_KERNEL_HEADERS_3_10
 	default "2.6"		if BR2_KERNEL_HEADERS_SNAP
 	default $BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
