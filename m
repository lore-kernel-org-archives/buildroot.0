From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 26 May 2019 09:24:28 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/tekui: replace
 utf-8 space by ascii character
Message-ID: <20190526072357.956508E149@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e934c41c7fe0c1c0d232fd86d454cf9fd65cba9d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Replace utf-8 NO-BREAK-SPACE (c2 a0) in comment line by simple
ascii space character.

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 784d41bec713e0f91be147e158596491295bb30d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
 
-#??Package does not build in parallel due to improper make rules
+# Package does not build in parallel due to improper make rules
 TEKUI_MAKE = $(MAKE1)
 
 TEKUI_MAKE_OPTS = \
