From: Francois Perrad <fperrad@gmail.com>
Date: Mon,  4 Sep 2017 19:50:37 +0200
Subject: [Buildroot] [PATCH 03/12] coxpcall: add LICENSE_FILES
In-Reply-To: <20170904175046.21530-1-francois.perrad@gadz.org>
References: <20170904175046.21530-1-francois.perrad@gadz.org>
Message-ID: <20170904175046.21530-3-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/coxpcall/coxpcall.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/coxpcall/coxpcall.mk b/package/coxpcall/coxpcall.mk
index 84c19f4ae..3af81f2ce 100644
--- a/package/coxpcall/coxpcall.mk
+++ b/package/coxpcall/coxpcall.mk
@@ -7,5 +7,6 @@
 COXPCALL_VERSION = 1.16.0-1
 COXPCALL_SUBDIR = coxpcall
 COXPCALL_LICENSE = MIT
+COXPCALL_LICENSE_FILES = $(COXPCALL_SUBDIR)/doc/license.html
 
 $(eval $(luarocks-package))
-- 
2.11.0
