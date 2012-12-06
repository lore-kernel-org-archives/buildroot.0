From: Viallard Anthony <viallard@syscom-instruments.com>
Date: Thu, 06 Dec 2012 16:18:20 +0100
Subject: [Buildroot] [PATCH] fix cjson package
Message-ID: <50C0B73C.9020407@syscom-instruments.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi buildroot guys,

I've try to use cjson package but there a download problem. So, I fix up 
the package Makefile and here the change :


diff --git a/package/cjson/cjson.mk b/package/cjson/cjson.mk
index ccc6010..728639d 100644
--- a/package/cjson/cjson.mk
+++ b/package/cjson/cjson.mk
@@ -3,8 +3,8 @@
  # cjson
  #
  #############################################################
-CJSON_VERSION         = undefined
-CJSON_SOURCE          = cJSONFiles.zip
+CJSON_VERSION         = 2011-10-10
+CJSON_SOURCE          = cJSONFiles-$(CJSON_VERSION).zip
  CJSON_SITE            = http://downloads.sourceforge.net/project/cjson/
  CJSON_INSTALL_STAGING = YES
  CJSON_LICENSE         = MIT


Cheers,
Viallard Anthony.
