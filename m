From: Francois Perrad <fperrad@gmail.com>
Date: Sat, 11 Jan 2014 16:42:17 +0100
Subject: [Buildroot] [pkg-luarocks infra v7 15/15] xavante: bump to version
	2.3.0
In-Reply-To: <1389454937-13494-1-git-send-email-francois.perrad@gadz.org>
References: <1389454937-13494-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1389454937-13494-16-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/xavante/xavante.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/xavante/xavante.mk b/package/xavante/xavante.mk
index c8d4d93..07f9ee6 100644
--- a/package/xavante/xavante.mk
+++ b/package/xavante/xavante.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAVANTE_VERSION = 2.2.0-1
+XAVANTE_VERSION = 2.3.0-1
 XAVANTE_LICENSE = MIT
 
 $(eval $(luarocks-package))
-- 
1.7.9.5
