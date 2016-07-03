From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Jul 2016 09:38:05 +0200
Subject: [Buildroot] [git commit] xutil_makedepend: add explicit
	dependencies for host variant
Message-ID: <20160703073820.30ACC80288@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fad2b2366d27cd39a5e98074888fb4ead7934fe3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julien Floret <julien.floret@6wind.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xutil_makedepend/xutil_makedepend.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/x11r7/xutil_makedepend/xutil_makedepend.mk b/package/x11r7/xutil_makedepend/xutil_makedepend.mk
index 81e348e..6fd3c1a 100644
--- a/package/x11r7/xutil_makedepend/xutil_makedepend.mk
+++ b/package/x11r7/xutil_makedepend/xutil_makedepend.mk
@@ -11,6 +11,7 @@ XUTIL_MAKEDEPEND_LICENSE = MIT
 XUTIL_MAKEDEPEND_LICENSE_FILES = COPYING
 
 XUTIL_MAKEDEPEND_DEPENDENCIES = xproto_xproto
+HOST_XUTIL_MAKEDEPEND_DEPENDENCIES = host-xproto_xproto
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
