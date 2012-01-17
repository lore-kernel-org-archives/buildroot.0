From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 17 Jan 2012 23:32:49 +0100
Subject: [Buildroot] [git commit] xapp_mkfontdir: removed redundant
	HOST_FOO_DEPENDENCIES
Message-ID: <20120117224425.5F7488FF38@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=38faeafab7cf0272093ad996225b2f7dbdaa2d42
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/x11r7/xapp_mkfontdir/xapp_mkfontdir.mk |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xapp_mkfontdir/xapp_mkfontdir.mk b/package/x11r7/xapp_mkfontdir/xapp_mkfontdir.mk
index 3957ba6..8047b21 100644
--- a/package/x11r7/xapp_mkfontdir/xapp_mkfontdir.mk
+++ b/package/x11r7/xapp_mkfontdir/xapp_mkfontdir.mk
@@ -8,7 +8,6 @@ XAPP_MKFONTDIR_VERSION = 1.0.5
 XAPP_MKFONTDIR_SOURCE = mkfontdir-$(XAPP_MKFONTDIR_VERSION).tar.bz2
 XAPP_MKFONTDIR_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_MKFONTDIR_DEPENDENCIES = xapp_mkfontscale
-HOST_XAPP_MKFONTDIR_DEPENDENCIES = host-xapp_mkfontscale
 
 $(eval $(call AUTOTARGETS))
 $(eval $(call AUTOTARGETS,host))
