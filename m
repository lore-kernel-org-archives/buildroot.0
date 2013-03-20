From: Jesper Baekdahl <jbb@gamblify.com>
Date: Wed, 20 Mar 2013 15:11:02 +0100
Subject: [Buildroot] [git commit] xutil_makedepend: bump revision to X11R7.7
Message-ID: <20130324225157.9284A9B2A2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a793ff0aa467daa3f057a091e80513f6f956dc1b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Will Wagner <will_wagner@carallon.com>
---
 package/x11r7/xutil_makedepend/xutil_makedepend.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xutil_makedepend/xutil_makedepend.mk b/package/x11r7/xutil_makedepend/xutil_makedepend.mk
index e6b6238..ff4d9bd 100644
--- a/package/x11r7/xutil_makedepend/xutil_makedepend.mk
+++ b/package/x11r7/xutil_makedepend/xutil_makedepend.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XUTIL_MAKEDEPEND_VERSION = 1.0.2
+XUTIL_MAKEDEPEND_VERSION = 1.0.4
 XUTIL_MAKEDEPEND_SOURCE = makedepend-$(XUTIL_MAKEDEPEND_VERSION).tar.bz2
 XUTIL_MAKEDEPEND_SITE = http://xorg.freedesktop.org/releases/individual/util
 
