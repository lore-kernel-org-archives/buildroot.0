From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Jul 2017 22:44:31 +0200
Subject: [Buildroot] [git commit] librsvg: update homepage link
Message-ID: <20170729204032.D9EAC81F7B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a81979758dcf6c5e8e41bc4f910049abb38afbd4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The SF page redirects to gnome.org.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/librsvg/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/librsvg/Config.in b/package/librsvg/Config.in
index 211c53a..ffb0287 100644
--- a/package/librsvg/Config.in
+++ b/package/librsvg/Config.in
@@ -16,7 +16,7 @@ config BR2_PACKAGE_LIBRSVG
 	  The rsvg library is an efficient renderer for Scalable
 	  Vector Graphics (SVG) pictures.
 
-	  http://librsvg.sourceforge.net/
+	  https://wiki.gnome.org/Projects/LibRsvg
 
 comment "librsvg needs a toolchain w/ wchar, threads, C++"
 	depends on BR2_USE_MMU
