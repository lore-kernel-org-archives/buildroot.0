From: Phil Eichinger <phil.eichinger@gmail.com>
Date: Tue,  6 May 2014 22:25:00 +0200
Subject: [Buildroot] [PATCH 2/3] protobuf: bump to version 2.5.0
In-Reply-To: <1399407901-740-1-git-send-email-phil@zankapfel.net>
References: <1399407901-740-1-git-send-email-phil@zankapfel.net>
Message-ID: <1399407901-740-2-git-send-email-phil@zankapfel.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Phil Eichinger <phil@zankapfel.net>
---
 package/protobuf/protobuf.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/protobuf/protobuf.mk b/package/protobuf/protobuf.mk
index 3538aaa..ceb64df 100644
--- a/package/protobuf/protobuf.mk
+++ b/package/protobuf/protobuf.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PROTOBUF_VERSION = 2.4.1
+PROTOBUF_VERSION = 2.5.0
 PROTOBUF_SITE = http://protobuf.googlecode.com/files/
 PROTOBUF_LICENSE = BSD-3c
 PROTOBUF_LICENSE_FILES = COPYING.txt
-- 
1.7.10.4
