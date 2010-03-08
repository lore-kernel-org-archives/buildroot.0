From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Fix xinit version in description
Message-ID: <20100308133620.1C97D776E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=5f065284e4ca50b12e061789d8e63650dc5107f9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 package/x11r7/xapp_xinit/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xapp_xinit/Config.in b/package/x11r7/xapp_xinit/Config.in
index 74e3191..22c788e 100644
--- a/package/x11r7/xapp_xinit/Config.in
+++ b/package/x11r7/xapp_xinit/Config.in
@@ -3,5 +3,5 @@ config BR2_PACKAGE_XAPP_XINIT
 	select BR2_PACKAGE_XAPP_XAUTH
 	select BR2_PACKAGE_XLIB_LIBX11
 	help
-	  xinit 1.0.3
+	  xinit 1.0.5
 	  X Window System initializer
-- 
1.6.3.3
