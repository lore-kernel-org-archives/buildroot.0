From: Frederic Bassaler <frederic.bassaler@gmail.com>
Date: Mon, 12 Sep 2011 00:08:17 +0200
Subject: [Buildroot] [git commit] xterm: bump to v271
Message-ID: <20110912052631.9B98B8D58C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=0e85b480ca131bbe5e152c281ffb312fc4ee4d65
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Frederic Bassaler <frederic.bassaler@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
1.7.3.4
