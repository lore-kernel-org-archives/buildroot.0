From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 2 Jul 2014 00:44:00 +0200
Subject: [Buildroot] [git commit] xterm: add license information
Message-ID: <20140701224922.8F4F79D12D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0b0285213d156f20b94e906b568c77f2c9982a20
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/xterm/xterm.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/xterm/xterm.mk b/package/xterm/xterm.mk
index ceb5d76..3269d8c 100644
--- a/package/xterm/xterm.mk
+++ b/package/xterm/xterm.mk
@@ -9,5 +9,7 @@ XTERM_SOURCE = xterm-$(XTERM_VERSION).tgz
 XTERM_SITE = ftp://invisible-island.net/xterm
 XTERM_DEPENDENCIES = ncurses xlib_libXaw
 XTERM_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
+XTERM_LICENSE = MIT
+XTERM_LICENSE_FILES = version.c
 
 $(eval $(autotools-package))
