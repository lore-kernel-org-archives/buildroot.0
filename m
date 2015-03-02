From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 02 Mar 2015 22:27:19 -0000
Subject: [Buildroot] [git commit] package/x11r7/xapp_bdftopcf: bump version
	to 1.0.5
Message-ID: <20150302222716.87DFE807B5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=525194a0166a78b02c4f441a7c43b54e763a282b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xapp_bdftopcf/xapp_bdftopcf.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xapp_bdftopcf/xapp_bdftopcf.mk b/package/x11r7/xapp_bdftopcf/xapp_bdftopcf.mk
index 64c2103..ebdcda5 100644
--- a/package/x11r7/xapp_bdftopcf/xapp_bdftopcf.mk
+++ b/package/x11r7/xapp_bdftopcf/xapp_bdftopcf.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_BDFTOPCF_VERSION = 1.0.4
+XAPP_BDFTOPCF_VERSION = 1.0.5
 XAPP_BDFTOPCF_SOURCE = bdftopcf-$(XAPP_BDFTOPCF_VERSION).tar.bz2
 XAPP_BDFTOPCF_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_BDFTOPCF_LICENSE = MIT
