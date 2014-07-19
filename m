From: Francois Perrad <fperrad@gmail.com>
Date: Sat, 19 Jul 2014 16:38:56 +0200
Subject: [Buildroot] [lua V4 2/4] luainterpreter: add host variant
In-Reply-To: <1405780738-31323-1-git-send-email-francois.perrad@gadz.org>
References: <1405780738-31323-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1405780738-31323-3-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

host-luainterpreter is host-lua or host-luajit

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/luainterpreter/luainterpreter.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/luainterpreter/luainterpreter.mk b/package/luainterpreter/luainterpreter.mk
index aa02696..4ef0a45 100644
--- a/package/luainterpreter/luainterpreter.mk
+++ b/package/luainterpreter/luainterpreter.mk
@@ -7,3 +7,4 @@
 LUAINTERPRETER_ABIVER = $(call qstrip,$(BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION))
 
 $(eval $(virtual-package))
+$(eval $(host-virtual-package))
-- 
1.9.1
