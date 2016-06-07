From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  6 Jun 2016 21:44:11 -0300
Subject: [Buildroot] [PATCH] xterm: bump to version 325
Message-ID: <1465260251-14804-1-git-send-email-gustavo@zacarias.com.ar>
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
index f68b29f..206bb91 100644
--- a/package/xterm/xterm.hash
+++ b/package/xterm/xterm.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	70ecbec8d27789248e8ae2dc2cf159a2e189c152a6559a2b3df7f4838da36092	xterm-324.tgz
+sha256	3b31b07a0c40427e9330ec3be9d1a748c72808f945953cea9e526e48be315f1b	xterm-325.tgz
diff --git a/package/xterm/xterm.mk b/package/xterm/xterm.mk
index 38271bb..3495ad9 100644
--- a/package/xterm/xterm.mk
+++ b/package/xterm/xterm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XTERM_VERSION = 324
+XTERM_VERSION = 325
 XTERM_SOURCE = xterm-$(XTERM_VERSION).tgz
 XTERM_SITE = http://invisible-mirror.net/archives/xterm
 XTERM_DEPENDENCIES = ncurses xlib_libXaw host-pkgconf
-- 
2.7.3
