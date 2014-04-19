From: Francois Perrad <fperrad@gmail.com>
Date: Sat, 19 Apr 2014 22:57:57 +0200
Subject: [Buildroot] [PATCH 5/8] wsapi: bump to version 1.6.1
In-Reply-To: <1397941080-24157-1-git-send-email-francois.perrad@gadz.org>
References: <1397941080-24157-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1397941080-24157-6-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/wsapi/wsapi.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/wsapi/wsapi.mk b/package/wsapi/wsapi.mk
index 9171b71..0cca6cb 100644
--- a/package/wsapi/wsapi.mk
+++ b/package/wsapi/wsapi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WSAPI_VERSION = 1.6-1
+WSAPI_VERSION = 1.6.1-1
 WSAPI_LICENSE = MIT
 
 $(eval $(luarocks-package))
-- 
1.9.1
