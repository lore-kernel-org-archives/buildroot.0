From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 02 Aug 2012 19:52:35 -0000
Subject: [Buildroot] [git commit branch/next] kernel-headers: bump 3.{2,
	3}.x stable versions
Message-ID: <20120802195231.558A981EDD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f7f0d137c581ffed2c8d8424faf290812f7fac65
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/kernel-headers/Config.in                 |    4 ++--
 ...umode_t.patch => linux-3.3.6-fix-umode_t.patch} |    0
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/toolchain/kernel-headers/Config.in b/toolchain/kernel-headers/Config.in
index 36370b4..d8602f1 100644
--- a/toolchain/kernel-headers/Config.in
+++ b/toolchain/kernel-headers/Config.in
@@ -65,7 +65,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "2.6.39.4"	if BR2_KERNEL_HEADERS_2_6_39
 	default "3.0.31"	if BR2_KERNEL_HEADERS_3_0
 	default "3.1.10"	if BR2_KERNEL_HEADERS_3_1
-	default "3.2.16"	if BR2_KERNEL_HEADERS_3_2
-	default "3.3.5"		if BR2_KERNEL_HEADERS_3_3
+	default "3.2.17"	if BR2_KERNEL_HEADERS_3_2
+	default "3.3.6"		if BR2_KERNEL_HEADERS_3_3
 	default "2.6"		if BR2_KERNEL_HEADERS_SNAP
 	default $BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
diff --git a/toolchain/kernel-headers/linux-3.3.5-fix-umode_t.patch b/toolchain/kernel-headers/linux-3.3.6-fix-umode_t.patch
similarity index 100%
rename from toolchain/kernel-headers/linux-3.3.5-fix-umode_t.patch
rename to toolchain/kernel-headers/linux-3.3.6-fix-umode_t.patch
