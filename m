From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 6 Apr 2017 22:29:53 +0200
Subject: [Buildroot] [git commit] package/libvpx: bump version to 1.6.1
Message-ID: <20170406203139.E803782670@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4fab48e133b4083cdc7efe208a045b361ad28101
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Rebased patch 0001.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libvpx/0001-vpx_mem-vpx_mem.h-Fix-compilation-with-uClibc.patch | 2 +-
 package/libvpx/libvpx.hash                                              | 2 +-
 package/libvpx/libvpx.mk                                                | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libvpx/0001-vpx_mem-vpx_mem.h-Fix-compilation-with-uClibc.patch b/package/libvpx/0001-vpx_mem-vpx_mem.h-Fix-compilation-with-uClibc.patch
index 20f08c9..e17ff71 100644
--- a/package/libvpx/0001-vpx_mem-vpx_mem.h-Fix-compilation-with-uClibc.patch
+++ b/package/libvpx/0001-vpx_mem-vpx_mem.h-Fix-compilation-with-uClibc.patch
@@ -20,7 +20,7 @@ index c14f288..82df745 100644
  
  #include "vpx_config.h"
 -#if defined(__uClinux__)
--# include <lddk.h>
+-#include <lddk.h>
 -#endif
  
  #include <stdlib.h>
diff --git a/package/libvpx/libvpx.hash b/package/libvpx/libvpx.hash
index f0240d6..95ff3a8 100644
--- a/package/libvpx/libvpx.hash
+++ b/package/libvpx/libvpx.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256  d0afbb5eb1ecae68f8d578abace160a97e2e8a230e3028cf4db115d59a695aad  libvpx-1.6.0.tar.bz2
+sha256 1c2c0c2a97fba9474943be34ee39337dee756780fc12870ba1dc68372586a819  libvpx-1.6.1.tar.bz2
diff --git a/package/libvpx/libvpx.mk b/package/libvpx/libvpx.mk
index c4f102b..24c3903 100644
--- a/package/libvpx/libvpx.mk
+++ b/package/libvpx/libvpx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBVPX_VERSION = 1.6.0
+LIBVPX_VERSION = 1.6.1
 LIBVPX_SOURCE = libvpx-$(LIBVPX_VERSION).tar.bz2
 LIBVPX_SITE = http://storage.googleapis.com/downloads.webmproject.org/releases/webm
 LIBVPX_LICENSE = BSD-3-Clause
