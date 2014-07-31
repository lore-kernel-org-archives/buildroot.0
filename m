From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 31 Jul 2014 20:22:02 +0200
Subject: [Buildroot] [git commit] libndp: bump to 1.4
Message-ID: <20140731182239.A70A79D32D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1437558020f5598de4e0ef4daf0f2a09e76bbd76
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libndp/libndp.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libndp/libndp.mk b/package/libndp/libndp.mk
index 2f11a07..613aee8 100644
--- a/package/libndp/libndp.mk
+++ b/package/libndp/libndp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNDP_VERSION = v1.3
+LIBNDP_VERSION = v1.4
 LIBNDP_SITE = $(call github,jpirko,libndp,$(LIBNDP_VERSION))
 LIBNDP_LICENSE = LGPLv2.1+
 LIBNDP_LICENSE_FILES = COPYING
