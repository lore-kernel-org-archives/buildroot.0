From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 5 Jan 2014 22:11:57 +0100
Subject: [Buildroot] [git commit] xorg: Bump xproto_xproto version to 7.0.25
Message-ID: <20140105230942.31F459BE33@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e8ac7537186e3b5318a3872d39a5a6e4e4b3657b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/xproto_xproto/xproto_xproto.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xproto_xproto/xproto_xproto.mk b/package/x11r7/xproto_xproto/xproto_xproto.mk
index bfff3be..46779f6 100644
--- a/package/x11r7/xproto_xproto/xproto_xproto.mk
+++ b/package/x11r7/xproto_xproto/xproto_xproto.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XPROTO_XPROTO_VERSION = 7.0.23
+XPROTO_XPROTO_VERSION = 7.0.25
 XPROTO_XPROTO_SOURCE = xproto-$(XPROTO_XPROTO_VERSION).tar.bz2
 XPROTO_XPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
 XPROTO_XPROTO_LICENSE = MIT
