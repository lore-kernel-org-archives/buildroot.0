From: Francois Perrad <fperrad@gmail.com>
Date: Mon,  4 Sep 2017 19:50:46 +0200
Subject: [Buildroot] [PATCH 12/12] xavante: add LICENSE_FILES
In-Reply-To: <20170904175046.21530-1-francois.perrad@gadz.org>
References: <20170904175046.21530-1-francois.perrad@gadz.org>
Message-ID: <20170904175046.21530-12-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/xavante/xavante.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/xavante/xavante.mk b/package/xavante/xavante.mk
index 20e4aabed..d962e7bca 100644
--- a/package/xavante/xavante.mk
+++ b/package/xavante/xavante.mk
@@ -6,5 +6,6 @@
 
 XAVANTE_VERSION = 2.4.0-1
 XAVANTE_LICENSE = MIT
+XAVANTE_LICENSE_FILES = $(XAVANTE_SUBDIR)/doc/us/license.html
 
 $(eval $(luarocks-package))
-- 
2.11.0
