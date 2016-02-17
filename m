From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 17 Feb 2016 15:56:29 -0300
Subject: [Buildroot] [PATCH] xterm: bump to version 322
Message-ID: <1455735389-11567-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/xterm/xterm.hash | 2 +-
 package/xterm/xterm.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/xterm/xterm.hash b/package/xterm/xterm.hash
index a6e2c69..c9d06eb 100644
--- a/package/xterm/xterm.hash
+++ b/package/xterm/xterm.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	a60dbb574334c081425fa30f011cd9f571e3be7a91e2a84e252461798bce24a7	xterm-320.tgz
+sha256	9adb41b53f76a3fccaa65d47a87d336094a523985d1d6a6b8cc468375ed109d6	xterm-322.tgz
diff --git a/package/xterm/xterm.mk b/package/xterm/xterm.mk
index 7cad0cb..0429685 100644
--- a/package/xterm/xterm.mk
+++ b/package/xterm/xterm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XTERM_VERSION = 320
+XTERM_VERSION = 322
 XTERM_SOURCE = xterm-$(XTERM_VERSION).tgz
 XTERM_SITE = http://invisible-mirror.net/archives/xterm
 XTERM_DEPENDENCIES = ncurses xlib_libXaw host-pkgconf
-- 
2.4.10
