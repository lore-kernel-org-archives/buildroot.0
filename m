From: Baruch Siach <baruch@tkos.co.il>
Date: Sat, 29 Jul 2017 23:19:37 +0300
Subject: [Buildroot] [PATCH 1/2] librsvg: update homepage link
Message-ID: <d8abd4dffe44b0b02408f19ce5eaf8e03e1610e3.1501359578.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The SF page redirects to gnome.org.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/librsvg/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/librsvg/Config.in b/package/librsvg/Config.in
index 211c53a79d39..ffb0287dbdd8 100644
--- a/package/librsvg/Config.in
+++ b/package/librsvg/Config.in
@@ -16,7 +16,7 @@ config BR2_PACKAGE_LIBRSVG
 	  The rsvg library is an efficient renderer for Scalable
 	  Vector Graphics (SVG) pictures.
 
-	  http://librsvg.sourceforge.net/
+	  https://wiki.gnome.org/Projects/LibRsvg
 
 comment "librsvg needs a toolchain w/ wchar, threads, C++"
 	depends on BR2_USE_MMU
-- 
2.13.2
