From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 12 Feb 2021 23:01:33 +0100
Subject: [Buildroot] [git commit] package/x11vnc: set X11VNC_CPE_ID_VALID
Message-ID: <20210212215302.A7F3883F52@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6afab4379e760b94f90140593fb2874158cb6976
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:x11vnc_project:x11vnc is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Ax11vnc_project%3Ax11vnc

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11vnc/x11vnc.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/x11vnc/x11vnc.mk b/package/x11vnc/x11vnc.mk
index 571febfcfc..aa0f14c456 100644
--- a/package/x11vnc/x11vnc.mk
+++ b/package/x11vnc/x11vnc.mk
@@ -12,6 +12,7 @@ X11VNC_CONF_OPTS = --without-sdl
 X11VNC_DEPENDENCIES = xlib_libXt xlib_libXext xlib_libXtst libvncserver
 X11VNC_LICENSE = GPL-2.0+
 X11VNC_LICENSE_FILES = COPYING
+X11VNC_CPE_ID_VALID = YES
 # 0002-scan-limit-access-to-shared-memory-segments-to-current-user.patch
 X11VNC_IGNORE_CVES += CVE-2020-29074
 
