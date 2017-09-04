From: Francois Perrad <fperrad@gmail.com>
Date: Mon,  4 Sep 2017 19:50:39 +0200
Subject: [Buildroot] [PATCH 05/12] luaexpat: add LICENSE_FILES
In-Reply-To: <20170904175046.21530-1-francois.perrad@gadz.org>
References: <20170904175046.21530-1-francois.perrad@gadz.org>
Message-ID: <20170904175046.21530-5-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/luaexpat/luaexpat.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/luaexpat/luaexpat.mk b/package/luaexpat/luaexpat.mk
index c6768dcc1..c7377f6af 100644
--- a/package/luaexpat/luaexpat.mk
+++ b/package/luaexpat/luaexpat.mk
@@ -7,5 +7,6 @@
 LUAEXPAT_VERSION = 1.3.0-1
 LUAEXPAT_DEPENDENCIES = expat
 LUAEXPAT_LICENSE = MIT
+LUAEXPAT_LICENSE_FILES = $(LUAEXPAT_SUBDIR)/doc/us/license.html
 
 $(eval $(luarocks-package))
-- 
2.11.0
