From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 26 Apr 2013 12:58:49 +0200
Subject: [Buildroot] [git commit] kernel-headers: bump 3.{0, 2, 4,
	8}.x stable version
Message-ID: <20130426105901.D77429B85D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b526a80e6d5f415045ea4b44cc885bab73838383
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/kernel-headers/Config.in                 |    8 ++++----
 ...all-fix-__packed-in-exported-kernel-head.patch} |    0
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/toolchain/kernel-headers/Config.in b/toolchain/kernel-headers/Config.in
index ec75c34..17bd80b 100644
--- a/toolchain/kernel-headers/Config.in
+++ b/toolchain/kernel-headers/Config.in
@@ -63,14 +63,14 @@ config BR2_DEFAULT_KERNEL_VERSION
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "3.0.74"	if BR2_KERNEL_HEADERS_3_0
+	default "3.0.75"	if BR2_KERNEL_HEADERS_3_0
 	default "3.1.10"	if BR2_KERNEL_HEADERS_3_1
-	default "3.2.43"	if BR2_KERNEL_HEADERS_3_2
+	default "3.2.44"	if BR2_KERNEL_HEADERS_3_2
 	default "3.3.8"		if BR2_KERNEL_HEADERS_3_3
-	default "3.4.41"	if BR2_KERNEL_HEADERS_3_4
+	default "3.4.42"	if BR2_KERNEL_HEADERS_3_4
 	default "3.5.7"		if BR2_KERNEL_HEADERS_3_5
 	default "3.6.11"	if BR2_KERNEL_HEADERS_3_6
 	default "3.7.10"	if BR2_KERNEL_HEADERS_3_7
-	default "3.8.8"		if BR2_KERNEL_HEADERS_3_8
+	default "3.8.9"		if BR2_KERNEL_HEADERS_3_8
 	default "2.6"		if BR2_KERNEL_HEADERS_SNAP
 	default $BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
diff --git a/toolchain/kernel-headers/linux-3.0.74-headers_install-fix-__packed-in-exported-kernel-head.patch b/toolchain/kernel-headers/linux-3.0.75-headers_install-fix-__packed-in-exported-kernel-head.patch
similarity index 100%
rename from toolchain/kernel-headers/linux-3.0.74-headers_install-fix-__packed-in-exported-kernel-head.patch
rename to toolchain/kernel-headers/linux-3.0.75-headers_install-fix-__packed-in-exported-kernel-head.patch
