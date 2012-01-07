From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 7 Jan 2012 20:44:07 +0100
Subject: [Buildroot] [git commit] xenomai: mention which kernel versions are
	supported
Message-ID: <20120107201230.79A618FFE7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c2c06aad27b59dc85d8747a05433aae51781a775
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 linux/Config.ext.in |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/linux/Config.ext.in b/linux/Config.ext.in
index b304efd..172fa76 100644
--- a/linux/Config.ext.in
+++ b/linux/Config.ext.in
@@ -9,6 +9,12 @@ config BR2_LINUX_KERNEL_EXT_XENOMAI
 	help
 	  Xenomai Kernel part.
 
+	  In the current version of Xenomai, the following kernel
+	  versions are supported: on Blackfin, 2.6.34 and 2.6.36.9, on
+	  SH4, 2.6.32.10, on x86, 2.6.35.9, 2.6.37.6, 2.6.38.8, on
+	  ARM, 2.6.35.9, 2.6.37.6, 2.6.38.8, on NIOS2, 2.6.35, on
+	  PowerPC, 2.6.35.7, 2.6.36.4, 3.0.8.
+
 config BR2_LINUX_KERNEL_EXT_XENOMAI_ADEOS_PATCH
 	depends on BR2_LINUX_KERNEL_EXT_XENOMAI
 	string "Path for Adeos patch file"
