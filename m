From: Steven Noonan <steven@uplinklabs.net>
Date: Wed,  4 Nov 2015 00:37:21 -0800
Subject: [Buildroot] [PATCH] protobuf: bump to 2.6.1
Message-ID: <1446626241-25745-1-git-send-email-steven@uplinklabs.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Steven Noonan <steven@uplinklabs.net>
---
 package/protobuf/protobuf.hash | 2 ++
 package/protobuf/protobuf.mk   | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)
 create mode 100644 package/protobuf/protobuf.hash

diff --git a/package/protobuf/protobuf.hash b/package/protobuf/protobuf.hash
new file mode 100644
index 0000000..78285b7
--- /dev/null
+++ b/package/protobuf/protobuf.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 2667b7cda4a6bc8a09e5463adf3b5984e08d94e72338277affa8594d8b6e5cd1 protobuf-v2.6.1.tar.gz
diff --git a/package/protobuf/protobuf.mk b/package/protobuf/protobuf.mk
index 0426fce..144e5fb 100644
--- a/package/protobuf/protobuf.mk
+++ b/package/protobuf/protobuf.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PROTOBUF_VERSION = v2.5.0
+PROTOBUF_VERSION = v2.6.1
 PROTOBUF_SITE = $(call github,google,protobuf,$(PROTOBUF_VERSION))
 PROTOBUF_LICENSE = BSD-3c
 PROTOBUF_LICENSE_FILES = COPYING.txt
-- 
2.6.2
