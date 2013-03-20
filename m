From: Jesper Baekdahl <jbb@gamblify.com>
Date: Wed, 20 Mar 2013 15:11:02 +0100
Subject: [Buildroot] [git commit] xproto_fontsproto: bump revision to X11R7.7
Message-ID: <20130324225155.72DE89A8FB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0a7ffcf73ceabea9848ecc5067b798987d978306
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Will Wagner <will_wagner@carallon.com>
---
 .../x11r7/xproto_fontsproto/xproto_fontsproto.mk   |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xproto_fontsproto/xproto_fontsproto.mk b/package/x11r7/xproto_fontsproto/xproto_fontsproto.mk
index 5252fd9..bb5efd3 100644
--- a/package/x11r7/xproto_fontsproto/xproto_fontsproto.mk
+++ b/package/x11r7/xproto_fontsproto/xproto_fontsproto.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XPROTO_FONTSPROTO_VERSION = 2.1.1
+XPROTO_FONTSPROTO_VERSION = 2.1.2
 XPROTO_FONTSPROTO_SOURCE = fontsproto-$(XPROTO_FONTSPROTO_VERSION).tar.bz2
 XPROTO_FONTSPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
 XPROTO_FONTSPROTO_INSTALL_STAGING = YES
