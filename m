From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 29 Dec 2019 10:28:17 +0100
Subject: [Buildroot] [git commit] package/fbterm: update the upstream URL in
 Config.in
Message-ID: <20191229091905.C90618E616@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c9f51cd58c42ffdffc3e1e3d0cca1ce66e1642d7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update the upstream URL in the help text in Config.in. This
addresses the 'Invalid(405)' URL status in the package stats
web page output.

Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/fbterm/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/fbterm/Config.in b/package/fbterm/Config.in
index 3ab8bdb4d4..083167088a 100644
--- a/package/fbterm/Config.in
+++ b/package/fbterm/Config.in
@@ -10,7 +10,7 @@ config BR2_PACKAGE_FBTERM
 	  fbterm is a fast terminal emulator for Linux with frame buffer
 	  device or VESA video card.
 
-	  http://code.google.com/p/fbterm/
+	  https://code.google.com/archive/p/fbterm/
 
 comment "fbterm needs a toolchain w/ C++, wchar, locale"
 	depends on BR2_USE_MMU
