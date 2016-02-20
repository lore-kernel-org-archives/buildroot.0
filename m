From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 20 Feb 2016 23:09:08 +0100
Subject: [Buildroot] [PATCH/next 03/31] package/libplatform: bump version,
	add hash
In-Reply-To: <1456006176-21308-1-git-send-email-bernd.kuhls@t-online.de>
References: <1456006176-21308-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1456006176-21308-4-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libplatform/libplatform.hash | 2 ++
 package/libplatform/libplatform.mk   | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)
 create mode 100644 package/libplatform/libplatform.hash

diff --git a/package/libplatform/libplatform.hash b/package/libplatform/libplatform.hash
new file mode 100644
index 0000000..8975dfd
--- /dev/null
+++ b/package/libplatform/libplatform.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256  3603ead8b16a48cb35b1e6dea330a693f10552b1a6ea036c5db9ec248cd8baf5  libplatform-feafe68e3e0b02c3261aefb3d711863ef6fadd38.tar.gz
diff --git a/package/libplatform/libplatform.mk b/package/libplatform/libplatform.mk
index 4eb934f..6d54915 100644
--- a/package/libplatform/libplatform.mk
+++ b/package/libplatform/libplatform.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPLATFORM_VERSION = 1.0.10
+LIBPLATFORM_VERSION = feafe68e3e0b02c3261aefb3d711863ef6fadd38
 LIBPLATFORM_SITE = $(call github,Pulse-Eight,platform,$(LIBPLATFORM_VERSION))
 LIBPLATFORM_LICENSE = GPLv2+, PHP license v3.01
 LIBPLATFORM_LICENSE_FILES = src/os.h src/util/fstrcmp.c
-- 
2.7.0
