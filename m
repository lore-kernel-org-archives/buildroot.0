From: Jesper Baekdahl <jbb@gamblify.com>
Date: Wed, 20 Mar 2013 15:11:02 +0100
Subject: [Buildroot] [git commit] xproto_bigreqsproto: bump revision to
	X11R7.7
Message-ID: <20130324225155.50D999A8FB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f4dfa14eb3eadede81b8b7c6cb819489d81901c4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Will Wagner <will_wagner@carallon.com>
---
 .../xproto_bigreqsproto/xproto_bigreqsproto.mk     |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xproto_bigreqsproto/xproto_bigreqsproto.mk b/package/x11r7/xproto_bigreqsproto/xproto_bigreqsproto.mk
index dc236fa..1cf4b5f 100644
--- a/package/x11r7/xproto_bigreqsproto/xproto_bigreqsproto.mk
+++ b/package/x11r7/xproto_bigreqsproto/xproto_bigreqsproto.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XPROTO_BIGREQSPROTO_VERSION = 1.1.1
+XPROTO_BIGREQSPROTO_VERSION = 1.1.2
 XPROTO_BIGREQSPROTO_SOURCE = bigreqsproto-$(XPROTO_BIGREQSPROTO_VERSION).tar.bz2
 XPROTO_BIGREQSPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
 XPROTO_BIGREQSPROTO_INSTALL_STAGING = YES
