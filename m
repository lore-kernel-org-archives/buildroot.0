From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Jul 2009 11:55:13 +0200
Subject: [Buildroot] [PATCH 2/4] xorg: bump X.org server version to 1.5.3
In-Reply-To: <cover.1248774911.git.thomas.petazzoni@free-electrons.com>
References: <cover.1248774911.git.thomas.petazzoni@free-electrons.com>
Message-ID: <2831a05d03dc826f98d6bdcf0da6fc032d246ac8.1248774911.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This version contains a fix to allow the compilation of the Xvesa
server against recent versions of the kernel headers (fix
http://cgit.freedesktop.org/xorg/xserver/commit/?h=server-1.5-branch&id=992a7168f0db5733fe4a6cbd2f40c6b1f2a150e0)

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../xserver_xorg-server/xserver_xorg-server.mk     |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index e2af324..e9d5f36 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XSERVER_XORG_SERVER_VERSION = 1.5.2
+XSERVER_XORG_SERVER_VERSION = 1.5.3
 XSERVER_XORG_SERVER_SOURCE = xorg-server-$(XSERVER_XORG_SERVER_VERSION).tar.bz2
 XSERVER_XORG_SERVER_SITE = http://xorg.freedesktop.org/releases/individual/xserver
 XSERVER_XORG_SERVER_AUTORECONF = NO
-- 
1.6.0.4
