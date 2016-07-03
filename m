From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Jul 2016 09:31:16 +0200
Subject: [Buildroot] [git commit] xapp_mkfontdir: add explicit dependencies
	for host variant
Message-ID: <20160703073137.9EC3D8195E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=242486e2e355bcb7eb125b9878b204432233d604
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julien Floret <julien.floret@6wind.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xapp_mkfontdir/xapp_mkfontdir.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/x11r7/xapp_mkfontdir/xapp_mkfontdir.mk b/package/x11r7/xapp_mkfontdir/xapp_mkfontdir.mk
index b74f993..f2227bd 100644
--- a/package/x11r7/xapp_mkfontdir/xapp_mkfontdir.mk
+++ b/package/x11r7/xapp_mkfontdir/xapp_mkfontdir.mk
@@ -10,6 +10,7 @@ XAPP_MKFONTDIR_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_MKFONTDIR_LICENSE = MIT
 XAPP_MKFONTDIR_LICENSE_FILES = COPYING
 XAPP_MKFONTDIR_DEPENDENCIES = xapp_mkfontscale
+HOST_XAPP_MKFONTDIR_DEPENDENCIES = host-xapp_mkfontscale
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
