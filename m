From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 5 Jan 2014 22:17:19 +0100
Subject: [Buildroot] [git commit] xorg: Bump xproto_dri2proto version to 2.8
Message-ID: <20140105230942.7386D9C3D4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ec007ab751126796cf6ddd0ddcf25a070f697d5a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/xproto_dri2proto/xproto_dri2proto.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xproto_dri2proto/xproto_dri2proto.mk b/package/x11r7/xproto_dri2proto/xproto_dri2proto.mk
index 9b56bb1..e4ed7d8 100644
--- a/package/x11r7/xproto_dri2proto/xproto_dri2proto.mk
+++ b/package/x11r7/xproto_dri2proto/xproto_dri2proto.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XPROTO_DRI2PROTO_VERSION = 2.6
+XPROTO_DRI2PROTO_VERSION = 2.8
 XPROTO_DRI2PROTO_SOURCE = dri2proto-$(XPROTO_DRI2PROTO_VERSION).tar.bz2
 XPROTO_DRI2PROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
 XPROTO_DRI2PROTO_LICENSE = MIT
