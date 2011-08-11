From: Frederic Bassaler <frederic.bassaler@gmail.com>
Date: Thu, 11 Aug 2011 12:56:59 +0200
Subject: [Buildroot] [PATCH] xterm: bump to v271
Message-ID: <20110811125659.0150b551@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



Signed-off-by: Frederic Bassaler <frederic.bassaler@gmail.com>
---
 package/xterm/xterm.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/xterm/xterm.mk b/package/xterm/xterm.mk
index d5d193d..92ddd1e 100644
--- a/package/xterm/xterm.mk
+++ b/package/xterm/xterm.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-XTERM_VERSION = 267
+XTERM_VERSION = 271
 XTERM_SOURCE = xterm-$(XTERM_VERSION).tgz
 XTERM_SITE = ftp://invisible-island.net/xterm
 XTERM_DEPENDENCIES = ncurses xlib_libXaw
-- 
1.7.2.3
