From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 22 Jan 2013 20:44:32 +0100
Subject: [Buildroot] [git commit] kernel-headers: bump 3.{0, 4,
	7}.x stable versions
Message-ID: <20130122194502.F07C49A749@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6e044a3a5bb624eb44e3935d0a08d28b44c1b234
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/kernel-headers/Config.in                 |    6 +++---
 ...all-fix-__packed-in-exported-kernel-head.patch} |    0
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/toolchain/kernel-headers/Config.in b/toolchain/kernel-headers/Config.in
index d12a824..a966220 100644
--- a/toolchain/kernel-headers/Config.in
+++ b/toolchain/kernel-headers/Config.in
@@ -58,13 +58,13 @@ config BR2_DEFAULT_KERNEL_VERSION
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "3.0.59"	if BR2_KERNEL_HEADERS_3_0
+	default "3.0.60"	if BR2_KERNEL_HEADERS_3_0
 	default "3.1.10"	if BR2_KERNEL_HEADERS_3_1
 	default "3.2.37"	if BR2_KERNEL_HEADERS_3_2
 	default "3.3.8"		if BR2_KERNEL_HEADERS_3_3
-	default "3.4.26"	if BR2_KERNEL_HEADERS_3_4
+	default "3.4.27"	if BR2_KERNEL_HEADERS_3_4
 	default "3.5.7"		if BR2_KERNEL_HEADERS_3_5
 	default "3.6.11"	if BR2_KERNEL_HEADERS_3_6
-	default "3.7.3"		if BR2_KERNEL_HEADERS_3_7
+	default "3.7.4"		if BR2_KERNEL_HEADERS_3_7
 	default "2.6"		if BR2_KERNEL_HEADERS_SNAP
 	default $BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
diff --git a/toolchain/kernel-headers/linux-3.0.59-headers_install-fix-__packed-in-exported-kernel-head.patch b/toolchain/kernel-headers/linux-3.0.60-headers_install-fix-__packed-in-exported-kernel-head.patch
similarity index 100%
rename from toolchain/kernel-headers/linux-3.0.59-headers_install-fix-__packed-in-exported-kernel-head.patch
rename to toolchain/kernel-headers/linux-3.0.60-headers_install-fix-__packed-in-exported-kernel-head.patch
