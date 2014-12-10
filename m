From: =?UTF-8?q?J=C3=B6rg=20Krause?= <jkrause@posteo.de>
Date: Thu, 11 Dec 2014 00:18:49 +0100
Subject: [Buildroot] [PATCH 1/1] package/libuv: bump to version 1.0.2
Message-ID: <1418253529-10179-1-git-send-email-jkrause@posteo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libuv has moved to github.com/libuv/libuv

Signed-off-by: J?rg Krause <jkrause@posteo.de>
---
 package/libuv/libuv.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libuv/libuv.mk b/package/libuv/libuv.mk
index 08bf8c5..33f8d2c 100644
--- a/package/libuv/libuv.mk
+++ b/package/libuv/libuv.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBUV_VERSION = v0.11.29
-LIBUV_SITE = $(call github,joyent,libuv,$(LIBUV_VERSION))
+LIBUV_VERSION = v1.0.2
+LIBUV_SITE = $(call github,libuv,libuv,$(LIBUV_VERSION))
 LIBUV_DEPENDENCIES = host-pkgconf
 LIBUV_INSTALL_STAGING = YES
 LIBUV_AUTORECONF = YES
-- 
2.1.3
