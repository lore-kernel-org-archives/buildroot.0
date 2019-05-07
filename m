From: Peter Seiderer <ps.report@gmx.net>
Date: Tue,  7 May 2019 22:35:28 +0200
Subject: [Buildroot] [PATCH v1 08/28] package/tekui: replace utf-8 space by
 ascii character
In-Reply-To: <20190507203548.10337-1-ps.report@gmx.net>
References: <20190507203548.10337-1-ps.report@gmx.net>
Message-ID: <20190507203548.10337-8-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Replace utf-8 NO-BREAK-SPACE (c2 a0) in comment line by simple
ascii space character.

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/tekui/tekui.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/tekui/tekui.mk b/package/tekui/tekui.mk
index 3f39072527..13000edd3e 100644
--- a/package/tekui/tekui.mk
+++ b/package/tekui/tekui.mk
@@ -11,7 +11,7 @@ TEKUI_LICENSE = MIT
 TEKUI_LICENSE_FILES = COPYRIGHT
 TEKUI_DEPENDENCIES = freetype luainterpreter

-#?Package does not build in parallel due to improper make rules
+# Package does not build in parallel due to improper make rules
 TEKUI_MAKE = $(MAKE1)

 TEKUI_MAKE_OPTS = \
--
2.21.0
