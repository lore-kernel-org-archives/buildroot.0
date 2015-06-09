From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 9 Jun 2015 22:55:23 +0200
Subject: [Buildroot] [git commit] package/matchbox-wm: drop useless
	commented options
Message-ID: <20150609211051.7087281D65@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b95a85d4abaa7e0c6fb7e1a4fd3f5a5be90a965f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/matchbox/matchbox-wm/matchbox-wm.mk |    3 ---
 1 files changed, 0 insertions(+), 3 deletions(-)

diff --git a/package/matchbox/matchbox-wm/matchbox-wm.mk b/package/matchbox/matchbox-wm/matchbox-wm.mk
index 16f1417..da9efd7 100644
--- a/package/matchbox/matchbox-wm/matchbox-wm.mk
+++ b/package/matchbox/matchbox-wm/matchbox-wm.mk
@@ -25,10 +25,7 @@ endif
 endif
 
 ifeq ($(BR2_PACKAGE_XLIB_LIBXFT),y)
-#MATCHBOX_WM_OPTS += --enable-standalone-xft
 MATCHBOX_WM_DEPENDENCIES += xlib_libXft
-else
-#MATCHBOX_WM_OPTS += --disable-standalone-xft
 endif
 
 ifeq ($(BR2_PACKAGE_STARTUP_NOTIFICATION),y)
