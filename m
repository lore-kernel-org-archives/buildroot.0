From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  3 Jan 2012 21:48:48 +0100
Subject: [Buildroot] [PATCH 3/3] xenomai: mention which kernel versions are
	supported
In-Reply-To: <cover.1325623724.git.thomas.petazzoni@free-electrons.com>
References: <cover.1325623724.git.thomas.petazzoni@free-electrons.com>
Message-ID: <a6494d56e6a0e2a0ff08855ee59dbc57d1dd3670.1325623724.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
-- 
1.7.4.1
