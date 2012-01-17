From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 17 Jan 2012 23:32:40 +0100
Subject: [Buildroot] [git commit] xapp_mkfontscale: removed redundant
	HOST_FOO_DEPENDENCIES
Message-ID: <20120117224424.A150B8FF38@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f8245eb1952598d1c028ef3565def8550d6290aa
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/x11r7/xapp_mkfontscale/xapp_mkfontscale.mk |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xapp_mkfontscale/xapp_mkfontscale.mk b/package/x11r7/xapp_mkfontscale/xapp_mkfontscale.mk
index a4218b0..02e7824 100644
--- a/package/x11r7/xapp_mkfontscale/xapp_mkfontscale.mk
+++ b/package/x11r7/xapp_mkfontscale/xapp_mkfontscale.mk
@@ -8,7 +8,6 @@ XAPP_MKFONTSCALE_VERSION = 1.0.7
 XAPP_MKFONTSCALE_SOURCE = mkfontscale-$(XAPP_MKFONTSCALE_VERSION).tar.bz2
 XAPP_MKFONTSCALE_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_MKFONTSCALE_DEPENDENCIES = zlib freetype xlib_libfontenc xproto_xproto
-HOST_XAPP_MKFONTSCALE_DEPENDENCIES = host-zlib host-freetype host-xlib_libfontenc host-xproto_xproto
 
 $(eval $(call AUTOTARGETS))
 $(eval $(call AUTOTARGETS,host))
