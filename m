From: Jesper Baekdahl <jbb@gamblify.com>
Date: Wed, 20 Mar 2013 15:11:03 +0100
Subject: [Buildroot] [git commit] xproto_dri2proto: bump version
Message-ID: <20130324225158.450329B226@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6d56b9970309d01a1b1c49865169a9d1901b1e67
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

---
 package/x11r7/xproto_dri2proto/xproto_dri2proto.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xproto_dri2proto/xproto_dri2proto.mk b/package/x11r7/xproto_dri2proto/xproto_dri2proto.mk
index 99af25c..f2f3875 100644
--- a/package/x11r7/xproto_dri2proto/xproto_dri2proto.mk
+++ b/package/x11r7/xproto_dri2proto/xproto_dri2proto.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XPROTO_DRI2PROTO_VERSION = 2.3
+XPROTO_DRI2PROTO_VERSION = 2.6
 XPROTO_DRI2PROTO_SOURCE = dri2proto-$(XPROTO_DRI2PROTO_VERSION).tar.bz2
 XPROTO_DRI2PROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
 XPROTO_DRI2PROTO_INSTALL_STAGING = YES
