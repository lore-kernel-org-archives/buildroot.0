From: Francois Perrad <fperrad@gmail.com>
Date: Mon,  4 Sep 2017 19:50:35 +0200
Subject: [Buildroot] [PATCH 01/12] cgilua: add LICENSE_FILES
Message-ID: <20170904175046.21530-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/cgilua/cgilua.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/cgilua/cgilua.mk b/package/cgilua/cgilua.mk
index 73006ff8b..cd78841fd 100644
--- a/package/cgilua/cgilua.mk
+++ b/package/cgilua/cgilua.mk
@@ -6,5 +6,6 @@
 
 CGILUA_VERSION = 5.2.1-1
 CGILUA_LICENSE = MIT
+CGILUA_LICENSE_FILES = $(CGILUA_SUBDIR)/doc/us/license.html
 
 $(eval $(luarocks-package))
-- 
2.11.0
