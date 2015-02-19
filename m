From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 19 Feb 2015 21:32:31 +0100
Subject: [Buildroot] [git commit branch/next] xterm: remove superfluous
	INSTALL_TARGET_OPTS
Message-ID: <20150219203323.43F268179B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fec618d1172388b6b67288dd090184461725a8d2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/xterm/xterm.mk |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

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
