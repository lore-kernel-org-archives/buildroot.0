From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 1 Feb 2012 22:19:31 +0100
Subject: [Buildroot] [git commit] xterm: bump to 278
Message-ID: <20120201212001.C20BC9096E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d2f1e0a2f214dc7a60ba5ed285762400f4da37ad
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

bump version and add project's URL

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/xterm/Config.in |    1 +
 package/xterm/xterm.mk  |    2 +-
 2 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/xterm/Config.in b/package/xterm/Config.in
index 99c89cf..33adf25 100644
--- a/package/xterm/Config.in
+++ b/package/xterm/Config.in
@@ -6,3 +6,4 @@ config BR2_PACKAGE_XTERM
 	help
 	  xterm terminal emulator
 
+	  http://invisible-island.net/xterm/
diff --git a/package/xterm/xterm.mk b/package/xterm/xterm.mk
index fa36228..f462c7f 100644
--- a/package/xterm/xterm.mk
+++ b/package/xterm/xterm.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-XTERM_VERSION = 271
+XTERM_VERSION = 278
 XTERM_SOURCE = xterm-$(XTERM_VERSION).tgz
 XTERM_SITE = ftp://invisible-island.net/xterm
 XTERM_DEPENDENCIES = ncurses xlib_libXaw
