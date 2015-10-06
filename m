From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  6 Oct 2015 13:37:43 -0300
Subject: [Buildroot] [PATCH] xterm: bump to version 320
Message-ID: <1444149463-1269-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also switch to http site.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/xterm/xterm.hash | 2 +-
 package/xterm/xterm.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/xterm/xterm.hash b/package/xterm/xterm.hash
index d36d1c4..a6e2c69 100644
--- a/package/xterm/xterm.hash
+++ b/package/xterm/xterm.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	1dbf1e93796c1b71b22b84e82eb58bcf20a14a7f365158819f3b4dbb29fe93f0	xterm-314.tgz
+sha256	a60dbb574334c081425fa30f011cd9f571e3be7a91e2a84e252461798bce24a7	xterm-320.tgz
diff --git a/package/xterm/xterm.mk b/package/xterm/xterm.mk
index e7afff2..7cad0cb 100644
--- a/package/xterm/xterm.mk
+++ b/package/xterm/xterm.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XTERM_VERSION = 314
+XTERM_VERSION = 320
 XTERM_SOURCE = xterm-$(XTERM_VERSION).tgz
-XTERM_SITE = ftp://invisible-island.net/xterm
+XTERM_SITE = http://invisible-mirror.net/archives/xterm
 XTERM_DEPENDENCIES = ncurses xlib_libXaw host-pkgconf
 XTERM_LICENSE = MIT
 XTERM_LICENSE_FILES = version.c
-- 
2.4.9
