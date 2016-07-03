From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Jul 2016 09:29:45 +0200
Subject: [Buildroot] [git commit] libxcb: remove mistankenly added double
	host-xcb-proto dependency
Message-ID: <20160703073007.84D8981E5C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=30e4a4dfff9db23c25fa2e8e19735a03dd833993
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/libxcb/libxcb.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/x11r7/libxcb/libxcb.mk b/package/x11r7/libxcb/libxcb.mk
index dbb2a84..ba42418 100644
--- a/package/x11r7/libxcb/libxcb.mk
+++ b/package/x11r7/libxcb/libxcb.mk
@@ -17,7 +17,7 @@ LIBXCB_DEPENDENCIES = \
 	host-xcb-proto host-python host-pkgconf
 HOST_LIBXCB_DEPENDENCIES = \
 	host-libxslt host-libpthread-stubs host-xcb-proto host-xlib_libXdmcp \
-	host-xlib_libXau host-xcb-proto host-python host-pkgconf
+	host-xlib_libXau host-python host-pkgconf
 
 LIBXCB_CONF_OPTS = --with-doxygen=no
 HOST_LIBXCB_CONF_OPTS = --with-doxygen=no
