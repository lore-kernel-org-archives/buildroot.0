From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 7 May 2014 22:30:59 +0200
Subject: [Buildroot] [git commit] protobuf-c: bump to version 1.0.0-rc1
Message-ID: <20140507204846.291FB9CB25@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fcb5b619f8ad6a58f4afa88c46941848a58e40e0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Phil Eichinger <phil@zankapfel.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/protobuf-c/protobuf-c.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

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
