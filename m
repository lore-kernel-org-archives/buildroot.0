From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Mon, 30 Jan 2012 15:46:25 +0100
Subject: [Buildroot] [PATCH 3/3] xterm: bump to 278
In-Reply-To: <1327934785-3957-1-git-send-email-yegorslists@googlemail.com>
References: <1327934785-3957-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <1327934785-3957-3-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

bump version and add project's URL

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
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
-- 
1.7.1.1
