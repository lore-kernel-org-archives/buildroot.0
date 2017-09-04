From: Francois Perrad <fperrad@gmail.com>
Date: Mon,  4 Sep 2017 19:50:44 +0200
Subject: [Buildroot] [PATCH 10/12] wsapi-fcgi: add LICENSE_FILES
In-Reply-To: <20170904175046.21530-1-francois.perrad@gadz.org>
References: <20170904175046.21530-1-francois.perrad@gadz.org>
Message-ID: <20170904175046.21530-10-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/wsapi-fcgi/wsapi-fcgi.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/wsapi-fcgi/wsapi-fcgi.mk b/package/wsapi-fcgi/wsapi-fcgi.mk
index fe4a424ce..2b0e6b255 100644
--- a/package/wsapi-fcgi/wsapi-fcgi.mk
+++ b/package/wsapi-fcgi/wsapi-fcgi.mk
@@ -9,5 +9,6 @@ WSAPI_FCGI_VERSION = $(WSAPI_FCGI_VERSION_MAJOR)-1
 WSAPI_FCGI_SUBDIR = wsapi-$(WSAPI_FCGI_VERSION_MAJOR)
 WSAPI_FCGI_DEPENDENCIES = libfcgi
 WSAPI_FCGI_LICENSE = MIT
+WSAPI_FCGI_LICENSE_FILES = $(WSAPI_FCGI_SUBDIR)/doc/us/license.html
 
 $(eval $(luarocks-package))
-- 
2.11.0
