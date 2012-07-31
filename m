From: spdawson at gmail.com <spdawson@gmail.com>
Date: Tue, 31 Jul 2012 09:15:59 +0100
Subject: [Buildroot] [PATCH] protobuf: add license information
Message-ID: <1343722559-10028-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 package/protobuf/protobuf.mk |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/protobuf/protobuf.mk b/package/protobuf/protobuf.mk
index 6e49dd3..653e90e 100644
--- a/package/protobuf/protobuf.mk
+++ b/package/protobuf/protobuf.mk
@@ -6,6 +6,8 @@
 PROTOBUF_VERSION = 2.4.1
 PROTOBUF_SOURCE = protobuf-$(PROTOBUF_VERSION).tar.gz
 PROTOBUF_SITE = http://protobuf.googlecode.com/files/
+PROTOBUF_LICENSE = PROPRIETARY
+PROTOBUF_LICENSE_FILES = COPYING.txt
 
 # N.B. Need to use host protoc during cross compilation.
 PROTOBUF_DEPENDENCIES = host-protobuf
-- 
1.7.9.5
