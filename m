From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 07 Nov 2013 11:29:09 +0100
Subject: [Buildroot] [PATCH] trivial: pcmanfm: fix typo in config help
Message-ID: <58e3db422853edd9b6fa.1383820149@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 package/pcmanfm/Config.in |  4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pcmanfm/Config.in b/package/pcmanfm/Config.in
--- a/package/pcmanfm/Config.in
+++ b/package/pcmanfm/Config.in
@@ -8,8 +8,8 @@ config BR2_PACKAGE_PCMANFM
 	select BR2_PACKAGE_XLIB_LIBX11
 	depends on BR2_PACKAGE_LIBGTK2
 	help
-	  An extremly fast and lightweight file manager which features
-	  tabbed browsing and user-friendly interface.
+	  An extremely fast and lightweight file manager which features
+	  tabbed browsing and a user-friendly interface.
 
 	  http://internap.dl.sourceforge.net/sourceforge/pcmanfm
 
