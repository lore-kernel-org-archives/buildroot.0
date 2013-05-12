From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 12 May 2013 22:14:17 +0200
Subject: [Buildroot] [git commit] xserver_xorg-server: add license
	informations
Message-ID: <20130512202409.5A9869A166@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3dfbf657604ecf132b7b848d664c45dbac88a455
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../xserver_xorg-server/xserver_xorg-server.mk     |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index 1c51456..a2bc056 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -7,6 +7,8 @@
 XSERVER_XORG_SERVER_VERSION = 1.12.4
 XSERVER_XORG_SERVER_SOURCE = xorg-server-$(XSERVER_XORG_SERVER_VERSION).tar.bz2
 XSERVER_XORG_SERVER_SITE = http://xorg.freedesktop.org/releases/individual/xserver
+XSERVER_XORG_SERVER_LICENSE = MIT
+XSERVER_XORG_SERVER_LICENSE_FILES = COPYING
 XSERVER_XORG_SERVER_MAKE = $(MAKE1) # make install fails with parallel make
 XSERVER_XORG_SERVER_INSTALL_STAGING = YES
 XSERVER_XORG_SERVER_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) install install-data
