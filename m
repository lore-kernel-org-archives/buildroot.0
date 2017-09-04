From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 4 Sep 2017 22:50:52 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] librsvg: update homepage
	link
Message-ID: <20170904205601.9DF2C8211C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b758567fc96830efd2fe3c59f8b86852c6085a1a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

The SF page redirects to gnome.org.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit a81979758dcf6c5e8e41bc4f910049abb38afbd4)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/librsvg/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/librsvg/Config.in b/package/librsvg/Config.in
index 7ce9d06..703428d 100644
--- a/package/librsvg/Config.in
+++ b/package/librsvg/Config.in
@@ -16,7 +16,7 @@ config BR2_PACKAGE_LIBRSVG
 	  The rsvg library is an efficient renderer for Scalable
 	  Vector Graphics (SVG) pictures.
 
-	  http://librsvg.sourceforge.net/
+	  https://wiki.gnome.org/Projects/LibRsvg
 
 comment "librsvg needs a toolchain w/ wchar, threads, C++"
 	depends on BR2_USE_MMU
