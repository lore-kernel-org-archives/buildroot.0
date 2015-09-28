From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 28 Sep 2015 22:14:18 +0200
Subject: [Buildroot] [git commit] package/libdcadec: bump version
Message-ID: <20150928201423.37C038077E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=315f7d421a1a30d3645cf4cce9d778f083a11b3e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libdcadec/libdcadec.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libdcadec/libdcadec.mk b/package/libdcadec/libdcadec.mk
index 1c423f0..76862a6 100644
--- a/package/libdcadec/libdcadec.mk
+++ b/package/libdcadec/libdcadec.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBDCADEC_VERSION = 7b3b44cd180c9345c98be9062eac701eab5c7454
+LIBDCADEC_VERSION = 2a9186e34ce557d3af1a20f5b558d1e6687708b9
 LIBDCADEC_SITE = $(call github,foo86,dcadec,$(LIBDCADEC_VERSION))
 LIBDCADEC_LICENSE = LGPLv2.1+
 LIBDCADEC_LICENSE_FILES = COPYING.LGPLv2.1
