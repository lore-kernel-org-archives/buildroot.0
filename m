From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 17 Feb 2015 10:43:54 -0300
Subject: [Buildroot] [PATCH 1/2] xterm: remove superfluous
	INSTALL_TARGET_OPTS
Message-ID: <1424180635-10327-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/xterm/xterm.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/xterm/xterm.mk b/package/xterm/xterm.mk
index 3f5b978..7413875 100644
--- a/package/xterm/xterm.mk
+++ b/package/xterm/xterm.mk
@@ -8,7 +8,6 @@ XTERM_VERSION = 306
 XTERM_SOURCE = xterm-$(XTERM_VERSION).tgz
 XTERM_SITE = ftp://invisible-island.net/xterm
 XTERM_DEPENDENCIES = ncurses xlib_libXaw
-XTERM_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) install
 XTERM_LICENSE = MIT
 XTERM_LICENSE_FILES = version.c
 XTERM_CONF_OPTS = --enable-256-color
-- 
2.0.5
