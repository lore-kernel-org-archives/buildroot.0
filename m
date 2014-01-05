From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 5 Jan 2014 23:28:53 +0100
Subject: [Buildroot] [git commit] xorg: Bump xutil_makedepend version to
	1.0.5
Message-ID: <20140105230943.0DA7A9C3D4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d7b109049f34bdbc962d0f2aa209ba0506a4847e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/xutil_makedepend/xutil_makedepend.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xutil_makedepend/xutil_makedepend.mk b/package/x11r7/xutil_makedepend/xutil_makedepend.mk
index 0a436d1..81e348e 100644
--- a/package/x11r7/xutil_makedepend/xutil_makedepend.mk
+++ b/package/x11r7/xutil_makedepend/xutil_makedepend.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XUTIL_MAKEDEPEND_VERSION = 1.0.4
+XUTIL_MAKEDEPEND_VERSION = 1.0.5
 XUTIL_MAKEDEPEND_SOURCE = makedepend-$(XUTIL_MAKEDEPEND_VERSION).tar.bz2
 XUTIL_MAKEDEPEND_SITE = http://xorg.freedesktop.org/releases/individual/util
 XUTIL_MAKEDEPEND_LICENSE = MIT
