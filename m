From: Marek Belisko <marek.belisko@open-nandra.com>
Date: Wed,  3 Jul 2013 22:51:20 +0200
Subject: [Buildroot] [PATCH] libiqrf: Bump to v0.1.2 + update build system.
Message-ID: <1372884680-14309-1-git-send-email-marek.belisko@open-nandra.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

v0.1.2 update build system from autotools to cmake.

Signed-off-by: Marek Belisko <marek.belisko@open-nandra.com>
---
 package/libiqrf/libiqrf.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libiqrf/libiqrf.mk b/package/libiqrf/libiqrf.mk
index f2d5b4c..df4bb42 100644
--- a/package/libiqrf/libiqrf.mk
+++ b/package/libiqrf/libiqrf.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-LIBIQRF_VERSION = v0.1.0
+LIBIQRF_VERSION = v0.1.2
 LIBIQRF_SITE = http://github.com/nandra/libiqrf/tarball/$(LIBIQRF_VERSION)
 LIBIQRF_INSTALL_STAGING = YES
 
 LIBIQRF_DEPENDENCIES = libusb
 
-$(eval $(autotools-package))
+$(eval $(cmake-package))
 
-- 
1.8.1.2
