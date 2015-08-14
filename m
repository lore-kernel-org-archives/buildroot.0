From: Nimai Mahajan <nimaim@gmail.com>
Date: Thu, 13 Aug 2015 21:41:21 -0400
Subject: [Buildroot] [PATCH 1/1] protobuf/protobuf-c: bump versions
Message-ID: <1439516481-3375-1-git-send-email-nimaim@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Nimai Mahajan <nimaim@gmail.com>

Signed-off-by: Nimai Mahajan <nimaim@gmail.com>
---
 package/protobuf-c/protobuf-c.mk | 2 +-
 package/protobuf/protobuf.mk     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

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
1.9.1
