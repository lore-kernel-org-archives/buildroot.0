From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 10 Jun 2014 09:17:27 -0300
Subject: [Buildroot] [PATCH] xterm: bump to version 306
Message-ID: <1402402647-13287-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/xterm/xterm.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/xterm/xterm.mk b/package/xterm/xterm.mk
index ec8251f..ceb5d76 100644
--- a/package/xterm/xterm.mk
+++ b/package/xterm/xterm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XTERM_VERSION = 278
+XTERM_VERSION = 306
 XTERM_SOURCE = xterm-$(XTERM_VERSION).tgz
 XTERM_SITE = ftp://invisible-island.net/xterm
 XTERM_DEPENDENCIES = ncurses xlib_libXaw
-- 
1.8.5.5
