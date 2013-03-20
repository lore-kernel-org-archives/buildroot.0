From: Jesper Baekdahl <jbb@gamblify.com>
Date: Wed, 20 Mar 2013 15:11:02 +0100
Subject: [Buildroot] [git commit] xproto_applewmproto: bump revision to
	X11R7.7
Message-ID: <20130324225155.1D9CA9B226@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=636f42afebce3aec30a43a3113284776683f4b01
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Will Wagner <will_wagner@carallon.com>
---
 .../xproto_applewmproto/xproto_applewmproto.mk     |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xproto_applewmproto/xproto_applewmproto.mk b/package/x11r7/xproto_applewmproto/xproto_applewmproto.mk
index f7b763a..a860227 100644
--- a/package/x11r7/xproto_applewmproto/xproto_applewmproto.mk
+++ b/package/x11r7/xproto_applewmproto/xproto_applewmproto.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XPROTO_APPLEWMPROTO_VERSION = 1.4.1
+XPROTO_APPLEWMPROTO_VERSION = 1.4.2
 XPROTO_APPLEWMPROTO_SOURCE = applewmproto-$(XPROTO_APPLEWMPROTO_VERSION).tar.bz2
 XPROTO_APPLEWMPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
 XPROTO_APPLEWMPROTO_INSTALL_STAGING = YES
