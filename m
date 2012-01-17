From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 17 Jan 2012 23:32:42 +0100
Subject: [Buildroot] [git commit] libxcb: removed redundant
	HOST_FOO_DEPENDENCIES
Message-ID: <20120117224425.0723C8FF38@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=605d22042b69378588bb3642533a3d0e6ec3a013
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/x11r7/libxcb/libxcb.mk |    4 ----
 1 files changed, 0 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/libxcb/libxcb.mk b/package/x11r7/libxcb/libxcb.mk
index a68779d..3e15951 100644
--- a/package/x11r7/libxcb/libxcb.mk
+++ b/package/x11r7/libxcb/libxcb.mk
@@ -17,10 +17,6 @@ LIBXCB_MAKE_OPT = XCBPROTO_XCBINCLUDEDIR=$(STAGING_DIR)/usr/share/xcb \
 	XCBPROTO_XCBPYTHONDIR=$(HOST_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages
 LIBXCB_CONF_OPT = --disable-build-docs
 
-HOST_LIBXCB_DEPENDENCIES = \
-	host-libxslt host-pthread-stubs host-xcb-proto host-xlib_libXdmcp \
-	host-xlib_libXau host-python
-
 HOST_LIBXCB_CONF_OPT = --disable-build-docs
 
 $(eval $(call AUTOTARGETS))
