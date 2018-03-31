From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Fri, 30 Mar 2018 23:22:34 -0300
Subject: [Buildroot] [PATCH 09/36] linux/linux-ext-*.mk: fit file header
 into one line
In-Reply-To: <20180331022301.27501-1-ricardo.martincoski@gmail.com>
References: <20180331022301.27501-1-ricardo.martincoski@gmail.com>
Message-ID: <20180331022301.27501-10-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Make it follow the package coding style by removing redundant info.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Christian Stewart <christian@paral.in>
Cc: David Lechner <david@lechnology.com>
---
 linux/linux-ext-aufs.mk                 | 2 +-
 linux/linux-ext-ev3dev-linux-drivers.mk | 2 +-
 linux/linux-ext-fbtft.mk                | 2 +-
 linux/linux-ext-rtai.mk                 | 2 +-
 linux/linux-ext-xenomai.mk              | 4 ++--
 5 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/linux/linux-ext-aufs.mk b/linux/linux-ext-aufs.mk
index fb2f3560a7..d4bbb07196 100644
--- a/linux/linux-ext-aufs.mk
+++ b/linux/linux-ext-aufs.mk
@@ -1,7 +1,7 @@
 ################################################################################
-# Linux Aufs extensions
 #
 # Patch the linux kernel with aufs extension
+#
 ################################################################################
 
 LINUX_EXTENSIONS += aufs
diff --git a/linux/linux-ext-ev3dev-linux-drivers.mk b/linux/linux-ext-ev3dev-linux-drivers.mk
index c8afeeb1d5..3bb12db38d 100644
--- a/linux/linux-ext-ev3dev-linux-drivers.mk
+++ b/linux/linux-ext-ev3dev-linux-drivers.mk
@@ -1,7 +1,7 @@
 ################################################################################
-# Linux ev3dev extensions
 #
 # Patch the linux kernel with ev3dev extension
+#
 ################################################################################
 
 LINUX_EXTENSIONS += ev3dev-linux-drivers
diff --git a/linux/linux-ext-fbtft.mk b/linux/linux-ext-fbtft.mk
index 5eb3d944e8..cbc9c58ed3 100644
--- a/linux/linux-ext-fbtft.mk
+++ b/linux/linux-ext-fbtft.mk
@@ -1,7 +1,7 @@
 ################################################################################
-# Linux fbtft extensions
 #
 # Patch the linux kernel with fbtft extension
+#
 ################################################################################
 
 LINUX_EXTENSIONS += fbtft
diff --git a/linux/linux-ext-rtai.mk b/linux/linux-ext-rtai.mk
index fb483aa80b..46e3dae3a7 100644
--- a/linux/linux-ext-rtai.mk
+++ b/linux/linux-ext-rtai.mk
@@ -1,7 +1,7 @@
 ################################################################################
-# Linux RTAI extensions
 #
 # Patch the linux kernel with RTAI extension
+#
 ################################################################################
 
 LINUX_EXTENSIONS += rtai
diff --git a/linux/linux-ext-xenomai.mk b/linux/linux-ext-xenomai.mk
index 76a9786e4d..d066bb32ac 100644
--- a/linux/linux-ext-xenomai.mk
+++ b/linux/linux-ext-xenomai.mk
@@ -1,7 +1,7 @@
 ################################################################################
-# Linux Adeos/Xenomai extensions
 #
-# Patch the linux kernel with xenomai extension
+# Patch the linux kernel with Adeos/Xenomai extension
+#
 ################################################################################
 
 LINUX_EXTENSIONS += xenomai
-- 
2.14.1
