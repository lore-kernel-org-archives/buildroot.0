From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 17 Jan 2012 23:32:42 +0100
Subject: [Buildroot] [git commit] xapp_bdftopcf: removed redundant
	HOST_FOO_DEPENDENCIES
Message-ID: <20120117224425.261D18FF38@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ea8805eb74fb71854f674b16a1e0d70509fd2677
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/x11r7/xapp_bdftopcf/xapp_bdftopcf.mk |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xapp_bdftopcf/xapp_bdftopcf.mk b/package/x11r7/xapp_bdftopcf/xapp_bdftopcf.mk
index c2d6335..00ce339 100644
--- a/package/x11r7/xapp_bdftopcf/xapp_bdftopcf.mk
+++ b/package/x11r7/xapp_bdftopcf/xapp_bdftopcf.mk
@@ -8,7 +8,6 @@ XAPP_BDFTOPCF_VERSION = 1.0.2
 XAPP_BDFTOPCF_SOURCE = bdftopcf-$(XAPP_BDFTOPCF_VERSION).tar.bz2
 XAPP_BDFTOPCF_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_BDFTOPCF_DEPENDENCIES = xlib_libXfont
-HOST_XAPP_BDFTOPCF_DEPENDENCIES = host-xlib_libXfont
 
 $(eval $(call AUTOTARGETS))
 $(eval $(call AUTOTARGETS,host))
