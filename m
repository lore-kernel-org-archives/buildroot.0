From: Francois Perrad <fperrad@gmail.com>
Date: Mon,  4 Sep 2017 19:50:40 +0200
Subject: [Buildroot] [PATCH 06/12] luaposix: fix LICENSE_FILES
In-Reply-To: <20170904175046.21530-1-francois.perrad@gadz.org>
References: <20170904175046.21530-1-francois.perrad@gadz.org>
Message-ID: <20170904175046.21530-6-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/luaposix/luaposix.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/luaposix/luaposix.mk b/package/luaposix/luaposix.mk
index a24323fd1..98dd8d658 100644
--- a/package/luaposix/luaposix.mk
+++ b/package/luaposix/luaposix.mk
@@ -7,7 +7,7 @@
 LUAPOSIX_VERSION = 34.0.1
 LUAPOSIX_SITE = $(call github,luaposix,luaposix,release-v$(LUAPOSIX_VERSION))
 LUAPOSIX_LICENSE = MIT
-LUAPOSIX_LICENSE_FILES = COPYING
+LUAPOSIX_LICENSE_FILES = LICENSE
 LUAPOSIX_DEPENDENCIES = luainterpreter host-lua
 LUAPOSIX_CONF_OPTS = --libdir="/usr/lib/lua/$(LUAINTERPRETER_ABIVER)" --datarootdir="/usr/share/lua/$(LUAINTERPRETER_ABIVER)"
 
-- 
2.11.0
