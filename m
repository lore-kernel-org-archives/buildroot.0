From: Jesper Baekdahl <jbb@gamblify.com>
Date: Wed, 20 Mar 2013 15:11:02 +0100
Subject: [Buildroot] [git commit] xproto_scrnsaverproto: bump revision to
	X11R7.7
Message-ID: <20130324225156.977609B226@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8d79087ae69ae8939760146f4bdd21627d0697e9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Will Wagner <will_wagner@carallon.com>
---
 .../xproto_scrnsaverproto/xproto_scrnsaverproto.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xproto_scrnsaverproto/xproto_scrnsaverproto.mk b/package/x11r7/xproto_scrnsaverproto/xproto_scrnsaverproto.mk
index 360db11..34e708c 100644
--- a/package/x11r7/xproto_scrnsaverproto/xproto_scrnsaverproto.mk
+++ b/package/x11r7/xproto_scrnsaverproto/xproto_scrnsaverproto.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XPROTO_SCRNSAVERPROTO_VERSION = 1.2.1
+XPROTO_SCRNSAVERPROTO_VERSION = 1.2.2
 XPROTO_SCRNSAVERPROTO_SOURCE = scrnsaverproto-$(XPROTO_SCRNSAVERPROTO_VERSION).tar.bz2
 XPROTO_SCRNSAVERPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
 XPROTO_SCRNSAVERPROTO_INSTALL_STAGING = YES
