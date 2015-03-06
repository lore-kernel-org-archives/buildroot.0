From: Philippe Proulx <eeppeliteloop@gmail.com>
Date: Fri,  6 Mar 2015 12:35:52 -0500
Subject: [Buildroot] [PATCH 2/7] lttng-tools: bump to version 2.6.0
In-Reply-To: <1425663357-22541-1-git-send-email-eeppeliteloop@gmail.com>
References: <1425663357-22541-1-git-send-email-eeppeliteloop@gmail.com>
Message-ID: <1425663357-22541-3-git-send-email-eeppeliteloop@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Philippe Proulx <eeppeliteloop@gmail.com>
---
 package/lttng-tools/Config.in        | 2 +-
 package/lttng-tools/lttng-tools.hash | 2 +-
 package/lttng-tools/lttng-tools.mk   | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/lttng-tools/Config.in b/package/lttng-tools/Config.in
index ea969a5..a960b21 100644
--- a/package/lttng-tools/Config.in
+++ b/package/lttng-tools/Config.in
@@ -13,7 +13,7 @@ config BR2_PACKAGE_LTTNG_TOOLS
 	depends on BR2_USE_WCHAR # util-linux
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
-	  Userspace utilities for the LTTng 2.0 tracing
+	  Userspace utilities for the LTTng 2.x tracing
 	  infrastructure.
 
 	  Those utilities are required on the target system to start
diff --git a/package/lttng-tools/lttng-tools.hash b/package/lttng-tools/lttng-tools.hash
index fc2640e..a356911 100644
--- a/package/lttng-tools/lttng-tools.hash
+++ b/package/lttng-tools/lttng-tools.hash
@@ -1,2 +1,2 @@
 # Locally generated
-sha256  1f52d342fb5b56a6675748f0b8e8557ec7c4e90732c3d8f5732bd10b920b233d  lttng-tools-2.5.2.tar.bz2
+sha256  128166445126d76da7d9f42a56dec12716732a1ed697a6cfdf40c9e135384f32  lttng-tools-2.6.0.tar.bz2
diff --git a/package/lttng-tools/lttng-tools.mk b/package/lttng-tools/lttng-tools.mk
index 44b6880..e218a95 100644
--- a/package/lttng-tools/lttng-tools.mk
+++ b/package/lttng-tools/lttng-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LTTNG_TOOLS_VERSION = 2.5.2
+LTTNG_TOOLS_VERSION = 2.6.0
 LTTNG_TOOLS_SITE = http://lttng.org/files/lttng-tools
 LTTNG_TOOLS_SOURCE = lttng-tools-$(LTTNG_TOOLS_VERSION).tar.bz2
 LTTNG_TOOLS_LICENSE = GPLv2+; LGPLv2.1+ for include/lttng/* and src/lib/lttng-ctl/*
-- 
2.2.1
