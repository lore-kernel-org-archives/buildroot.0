From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 2 Nov 2011 12:58:04 +0100
Subject: [Buildroot] [git commit] libxcb: needs pkg-config
Message-ID: <20111102115833.1484C8F165@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c1fa253a1b9180d349bcf9ada4898494d2221fc3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Reported-by: ??ukasz Pu??ka <lukasz@oxnet.pl>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/x11r7/libxcb/libxcb.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/libxcb/libxcb.mk b/package/x11r7/libxcb/libxcb.mk
index 106a8a4..8fb3dd3 100644
--- a/package/x11r7/libxcb/libxcb.mk
+++ b/package/x11r7/libxcb/libxcb.mk
@@ -11,7 +11,7 @@ LIBXCB_INSTALL_STAGING = YES
 
 LIBXCB_DEPENDENCIES = \
 	host-libxslt pthread-stubs xcb-proto xlib_libXdmcp xlib_libXau \
-	host-xcb-proto host-python
+	host-xcb-proto host-python host-pkg-config
 LIBXCB_CONF_ENV = STAGING_DIR="$(STAGING_DIR)"
 LIBXCB_MAKE_OPT = XCBPROTO_XCBINCLUDEDIR=$(STAGING_DIR)/usr/share/xcb \
 	XCBPROTO_XCBPYTHONDIR=$(HOST_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages
