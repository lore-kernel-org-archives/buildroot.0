From: Jesper Baekdahl <jbb@gamblify.com>
Date: Wed, 20 Mar 2013 15:11:02 +0100
Subject: [Buildroot] [git commit] xproto_kbproto: bump revision to X11R7.7
Message-ID: <20130324225156.05ECF9A8FB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a48579303639d17681a931675d0ee80396246084
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Will Wagner <will_wagner@carallon.com>
---
 package/x11r7/xproto_kbproto/xproto_kbproto.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xproto_kbproto/xproto_kbproto.mk b/package/x11r7/xproto_kbproto/xproto_kbproto.mk
index 8fcc8df..1c1973a 100644
--- a/package/x11r7/xproto_kbproto/xproto_kbproto.mk
+++ b/package/x11r7/xproto_kbproto/xproto_kbproto.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XPROTO_KBPROTO_VERSION = 1.0.5
+XPROTO_KBPROTO_VERSION = 1.0.6
 XPROTO_KBPROTO_SOURCE = kbproto-$(XPROTO_KBPROTO_VERSION).tar.bz2
 XPROTO_KBPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
 XPROTO_KBPROTO_INSTALL_STAGING = YES
