From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 18 Jul 2012 19:08:02 +0200
Subject: [Buildroot] [git commit] libexif: security bump to version 0.6.21
Message-ID: <20120718170909.5EDD89692C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9f16b69c595faf0eb48aa4fa581cbbb0bacde603
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes CVE-2012-2812, CVE-2012-2813, CVE-2012-2814, CVE-2012-2836,
CVE-2012-2837, CVE-2012-2840, CVE-2012-2841 and CVE-2012-2845.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libexif/libexif.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libexif/libexif.mk b/package/libexif/libexif.mk
index 7054b50..a54694c 100644
--- a/package/libexif/libexif.mk
+++ b/package/libexif/libexif.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-LIBEXIF_VERSION = 0.6.20
+LIBEXIF_VERSION = 0.6.21
 LIBEXIF_SOURCE = libexif-$(LIBEXIF_VERSION).tar.bz2
 LIBEXIF_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/project/libexif/libexif/$(LIBEXIF_VERSION)
 LIBEXIF_INSTALL_STAGING = YES
