From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 17 Jan 2012 23:32:42 +0100
Subject: [Buildroot] [git commit] xapp_xkbcomp: removed redundant
	HOST_FOO_DEPENDENCIES
Message-ID: <20120117224424.EE1EB8FF38@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=70bef8e49504de24df85ea72cdbc9212a1539785
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/x11r7/xapp_xkbcomp/xapp_xkbcomp.mk |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xapp_xkbcomp/xapp_xkbcomp.mk b/package/x11r7/xapp_xkbcomp/xapp_xkbcomp.mk
index f37d106..f92588c 100644
--- a/package/x11r7/xapp_xkbcomp/xapp_xkbcomp.mk
+++ b/package/x11r7/xapp_xkbcomp/xapp_xkbcomp.mk
@@ -8,7 +8,6 @@ XAPP_XKBCOMP_VERSION = 1.1.1
 XAPP_XKBCOMP_SOURCE = xkbcomp-$(XAPP_XKBCOMP_VERSION).tar.bz2
 XAPP_XKBCOMP_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XKBCOMP_DEPENDENCIES = xlib_libX11 xlib_libxkbfile
-HOST_XAPP_XKBCOMP_DEPENDENCIES = host-xlib_libX11 host-xlib_libxkbfile
 
 $(eval $(call AUTOTARGETS))
 $(eval $(call AUTOTARGETS,host))
