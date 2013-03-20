From: Jesper Baekdahl <jbb@gamblify.com>
Date: Wed, 20 Mar 2013 15:11:02 +0100
Subject: [Buildroot] [git commit] xproto_xextproto: bump revision to X11R7.7
Message-ID: <20130324225157.28E719B226@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=040baa82f3769ac6c6ea4557f81bc7eb16d4709c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Will Wagner <will_wagner@carallon.com>
---
 package/x11r7/xproto_xextproto/xproto_xextproto.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xproto_xextproto/xproto_xextproto.mk b/package/x11r7/xproto_xextproto/xproto_xextproto.mk
index 8114f78..cf7bd21 100644
--- a/package/x11r7/xproto_xextproto/xproto_xextproto.mk
+++ b/package/x11r7/xproto_xextproto/xproto_xextproto.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XPROTO_XEXTPROTO_VERSION = 7.2.0
+XPROTO_XEXTPROTO_VERSION = 7.2.1
 XPROTO_XEXTPROTO_SOURCE = xextproto-$(XPROTO_XEXTPROTO_VERSION).tar.bz2
 XPROTO_XEXTPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
 XPROTO_XEXTPROTO_INSTALL_STAGING = YES
