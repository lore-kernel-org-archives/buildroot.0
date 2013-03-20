From: Jesper Baekdahl <jbb@gamblify.com>
Date: Wed, 20 Mar 2013 15:11:02 +0100
Subject: [Buildroot] [git commit] xproto_recordproto: bump revision to
	X11R7.7
Message-ID: <20130324225156.379179A8FB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=dce4f431bafb506f3c848d2a30e50417cb28eb5c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Will Wagner <will_wagner@carallon.com>
---
 .../x11r7/xproto_recordproto/xproto_recordproto.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xproto_recordproto/xproto_recordproto.mk b/package/x11r7/xproto_recordproto/xproto_recordproto.mk
index 73f8a33..e97ebef 100644
--- a/package/x11r7/xproto_recordproto/xproto_recordproto.mk
+++ b/package/x11r7/xproto_recordproto/xproto_recordproto.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XPROTO_RECORDPROTO_VERSION = 1.14
+XPROTO_RECORDPROTO_VERSION = 1.14.2
 XPROTO_RECORDPROTO_SOURCE = recordproto-$(XPROTO_RECORDPROTO_VERSION).tar.bz2
 XPROTO_RECORDPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
 XPROTO_RECORDPROTO_INSTALL_STAGING = YES
