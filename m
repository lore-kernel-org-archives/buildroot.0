From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 11 Dec 2011 22:22:29 +0100
Subject: [Buildroot] [git commit] kernel-headers: bump 3.0.x / 3.1.x stable
	versions
Message-ID: <20111211215606.922348F8D6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=267e1672166741ec1d5049061cc010294545e512
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: rename headers_install patch so it gets applied]
Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/kernel-headers/Config.in                 |    4 ++--
 ...all-fix-__packed-in-exported-kernel-head.patch} |    0
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/toolchain/kernel-headers/Config.in b/toolchain/kernel-headers/Config.in
index 9e72b00..04407d1 100644
--- a/toolchain/kernel-headers/Config.in
+++ b/toolchain/kernel-headers/Config.in
@@ -57,7 +57,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "2.6.37.6"	if BR2_KERNEL_HEADERS_2_6_37
 	default "2.6.38.8"	if BR2_KERNEL_HEADERS_2_6_38
 	default "2.6.39.4"	if BR2_KERNEL_HEADERS_2_6_39
-	default "3.0.12"	if BR2_KERNEL_HEADERS_3_0
-	default "3.1.4"		if BR2_KERNEL_HEADERS_3_1
+	default "3.0.13"	if BR2_KERNEL_HEADERS_3_0
+	default "3.1.5"		if BR2_KERNEL_HEADERS_3_1
 	default "2.6"		if BR2_KERNEL_HEADERS_SNAP
 	default $BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
diff --git a/toolchain/kernel-headers/linux-3.0.12-headers_install-fix-__packed-in-exported-kernel-head.patch b/toolchain/kernel-headers/linux-3.0.13-headers_install-fix-__packed-in-exported-kernel-head.patch
similarity index 100%
rename from toolchain/kernel-headers/linux-3.0.12-headers_install-fix-__packed-in-exported-kernel-head.patch
rename to toolchain/kernel-headers/linux-3.0.13-headers_install-fix-__packed-in-exported-kernel-head.patch
