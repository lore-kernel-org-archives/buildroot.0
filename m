From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  4 Nov 2015 18:05:10 -0300
Subject: [Buildroot] [PATCH] protobuf: fix legal-info
Message-ID: <1446671110-27300-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The file changed from COPYING.txt to LICENSE, fixes:
http://autobuild.buildroot.net/results/c40/c40e9b6030584a4fd8b3e46f78f6d0702d1dc11e/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/protobuf/protobuf.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/protobuf/protobuf.mk b/package/protobuf/protobuf.mk
index 144e5fb..3eeadfc 100644
--- a/package/protobuf/protobuf.mk
+++ b/package/protobuf/protobuf.mk
@@ -7,7 +7,7 @@
 PROTOBUF_VERSION = v2.6.1
 PROTOBUF_SITE = $(call github,google,protobuf,$(PROTOBUF_VERSION))
 PROTOBUF_LICENSE = BSD-3c
-PROTOBUF_LICENSE_FILES = COPYING.txt
+PROTOBUF_LICENSE_FILES = LICENSE
 # no configure script
 PROTOBUF_AUTORECONF = YES
 
-- 
2.4.10
