From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 19 Feb 2015 22:33:33 +0100
Subject: [Buildroot] [git commit] package/x11r7/xserver_xorg-server:
	security bump to version 1.17.1
Message-ID: <20150302222720.0C2F7807B5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bac9bb2047bdd8f5c39c581b32219f2f18d72b8f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

CVE-2015-0255 - Information leak in the XkbSetGeometry request of X servers
http://www.x.org/wiki/Development/Security/Advisory-2015-02-10/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../xserver_xorg-server/xserver_xorg-server.hash   |    6 +++---
 .../xserver_xorg-server/xserver_xorg-server.mk     |    2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash b/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
index 26c3558..2c3cc5b 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
@@ -1,3 +1,3 @@
-# From http://lists.x.org/archives/xorg-announce/2015-February/002529.html
-sha1	35d9fbc4665fd847f17f97666dd7ce28aa46c785				xorg-server-1.17.0.tar.bz2
-sha256	4e8548bae163129d2fc8f8e1f3b6071fe9d62821e3d5617507ccd2f589526166	xorg-server-1.17.0.tar.bz2
+# From http://lists.x.org/archives/xorg-announce/2015-February/002530.html
+sha1	490118810a54e91c8814245c99d6285caf4985dd				xorg-server-1.17.1.tar.bz2
+sha256	2bf8e9f6f0a710dec1d2472467bff1f4e247cb6dcd76eb469aafdc8a2d7db2ab	xorg-server-1.17.1.tar.bz2
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index bd36eb3..b5a0df0 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XSERVER_XORG_SERVER_VERSION = 1.17.0
+XSERVER_XORG_SERVER_VERSION = 1.17.1
 XSERVER_XORG_SERVER_SOURCE = xorg-server-$(XSERVER_XORG_SERVER_VERSION).tar.bz2
 XSERVER_XORG_SERVER_SITE = http://xorg.freedesktop.org/releases/individual/xserver
 XSERVER_XORG_SERVER_LICENSE = MIT
