From: Steven Noonan <steven@uplinklabs.net>
Date: Wed,  4 Nov 2015 08:59:04 -0800
Subject: [Buildroot] [PATCH] protobuf-c: bump version to v1.1.1
Message-ID: <1446656344-2666-1-git-send-email-steven@uplinklabs.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Steven Noonan <steven@uplinklabs.net>
---
 package/protobuf-c/protobuf-c.mk | 2 +-
 package/protobuf-c/protobuf.hash | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)
 create mode 100644 package/protobuf-c/protobuf.hash

diff --git a/package/protobuf-c/protobuf-c.mk b/package/protobuf-c/protobuf-c.mk
index d73eb25..ee4500e 100644
--- a/package/protobuf-c/protobuf-c.mk
+++ b/package/protobuf-c/protobuf-c.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PROTOBUF_C_VERSION = v1.0.0-rc1
+PROTOBUF_C_VERSION = v1.1.1
 PROTOBUF_C_SITE = $(call github,protobuf-c,protobuf-c,$(PROTOBUF_C_VERSION))
 PROTOBUF_C_DEPENDENCIES = host-protobuf-c
 HOST_PROTOBUF_C_DEPENDENCIES = host-protobuf host-pkgconf
diff --git a/package/protobuf-c/protobuf.hash b/package/protobuf-c/protobuf.hash
new file mode 100644
index 0000000..e973c53
--- /dev/null
+++ b/package/protobuf-c/protobuf.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 09c5bb187b7a8e86bc0ff860f7df86370be9e8661cdb99c1072dcdab0763562c protobuf-c-1.1.1.tar.gz
-- 
2.6.2
