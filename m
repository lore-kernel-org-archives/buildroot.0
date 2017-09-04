From: Francois Perrad <fperrad@gmail.com>
Date: Mon,  4 Sep 2017 19:50:43 +0200
Subject: [Buildroot] [PATCH 09/12] wsapi: add LICENSE_FILES
In-Reply-To: <20170904175046.21530-1-francois.perrad@gadz.org>
References: <20170904175046.21530-1-francois.perrad@gadz.org>
Message-ID: <20170904175046.21530-9-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/wsapi/wsapi.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/wsapi/wsapi.mk b/package/wsapi/wsapi.mk
index 0cca6cb4d..64a27579f 100644
--- a/package/wsapi/wsapi.mk
+++ b/package/wsapi/wsapi.mk
@@ -6,5 +6,6 @@
 
 WSAPI_VERSION = 1.6.1-1
 WSAPI_LICENSE = MIT
+WSAPI_LICENSE_FILES = $(WSAPI_SUBDIR)/doc/us/license.html
 
 $(eval $(luarocks-package))
-- 
2.11.0
