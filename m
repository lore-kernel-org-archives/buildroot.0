From: Phil Eichinger <phil.eichinger@gmail.com>
Date: Tue,  6 May 2014 22:25:01 +0200
Subject: [Buildroot] [PATCH 3/3] protobuf-c: bump to version 1.0.0-rc1
In-Reply-To: <1399407901-740-1-git-send-email-phil@zankapfel.net>
References: <1399407901-740-1-git-send-email-phil@zankapfel.net>
Message-ID: <1399407901-740-3-git-send-email-phil@zankapfel.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Phil Eichinger <phil@zankapfel.net>
---
 package/protobuf-c/protobuf-c.mk |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/protobuf-c/protobuf-c.mk b/package/protobuf-c/protobuf-c.mk
index 75e15a2..da0b139 100644
--- a/package/protobuf-c/protobuf-c.mk
+++ b/package/protobuf-c/protobuf-c.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PROTOBUF_C_VERSION = 1d1ad931dfda273bb12b9925d4b8cc413131af03
+PROTOBUF_C_VERSION = v1.0.0-rc1
 PROTOBUF_C_SITE = $(call github,protobuf-c,protobuf-c,$(PROTOBUF_C_VERSION))
 PROTOBUF_C_DEPENDENCIES = host-protobuf-c
-HOST_PROTOBUF_C_DEPENDENCIES = host-protobuf
+HOST_PROTOBUF_C_DEPENDENCIES = host-protobuf host-pkgconf
 PROTOBUF_C_MAKE = $(MAKE1)
 PROTOBUF_C_CONF_OPT = --disable-protoc
 PROTOBUF_C_INSTALL_STAGING = YES
-- 
1.7.10.4
