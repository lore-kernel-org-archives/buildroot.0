From: Francois Perrad <fperrad@gmail.com>
Date: Sat, 11 Jan 2014 16:42:16 +0100
Subject: [Buildroot] [pkg-luarocks infra v7 14/15] wsapi: bump to version 1.6
In-Reply-To: <1389454937-13494-1-git-send-email-francois.perrad@gadz.org>
References: <1389454937-13494-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1389454937-13494-15-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/wsapi/wsapi.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/wsapi/wsapi.mk b/package/wsapi/wsapi.mk
index f1ea9b5..9171b71 100644
--- a/package/wsapi/wsapi.mk
+++ b/package/wsapi/wsapi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WSAPI_VERSION = 1.5-1
+WSAPI_VERSION = 1.6-1
 WSAPI_LICENSE = MIT
 
 $(eval $(luarocks-package))
-- 
1.7.9.5
