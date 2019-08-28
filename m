From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 28 Aug 2019 23:33:30 +0200
Subject: [Buildroot] [git commit branch/next] package/libvpx: bump version
 to 1.8.1
Message-ID: <20190828213540.8E536881A7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cea0941d1f3db4c337efce8c428a24e0a8bdddd5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Rebased patch.

Changelog: https://github.com/webmproject/libvpx/blob/master/CHANGELOG

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libvpx/0001-vpx_mem-vpx_mem.h-Fix-compilation-with-uClibc.patch | 2 +-
 package/libvpx/libvpx.hash                                              | 2 +-
 package/libvpx/libvpx.mk                                                | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libvpx/0001-vpx_mem-vpx_mem.h-Fix-compilation-with-uClibc.patch b/package/libvpx/0001-vpx_mem-vpx_mem.h-Fix-compilation-with-uClibc.patch
index e17ff71717..12960a6266 100644
--- a/package/libvpx/0001-vpx_mem-vpx_mem.h-Fix-compilation-with-uClibc.patch
+++ b/package/libvpx/0001-vpx_mem-vpx_mem.h-Fix-compilation-with-uClibc.patch
@@ -16,7 +16,7 @@ index c14f288..82df745 100644
 --- a/vpx_mem/vpx_mem.h
 +++ b/vpx_mem/vpx_mem.h
 @@ -12,9 +12,6 @@
- #define VPX_MEM_VPX_MEM_H_
+ #define VPX_VPX_MEM_VPX_MEM_H_
  
  #include "vpx_config.h"
 -#if defined(__uClinux__)
diff --git a/package/libvpx/libvpx.hash b/package/libvpx/libvpx.hash
index dde2f98a63..bbcde3a47b 100644
--- a/package/libvpx/libvpx.hash
+++ b/package/libvpx/libvpx.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256 86df18c694e1c06cc8f83d2d816e9270747a0ce6abe316e93a4f4095689373f6  libvpx-1.8.0.tar.gz
+sha256 df19b8f24758e90640e1ab228ab4a4676ec3df19d23e4593375e6f3847dee03e  libvpx-1.8.1.tar.gz
 sha256 8267348d5af1262c11d1a08de2f5afc77457755f1ac658627dd9acf71011d615  LICENSE
 sha256 cc3273e0694ea5896145e0677699b53471b03ea43021ddc50e7923fbb9f5023c  PATENTS
diff --git a/package/libvpx/libvpx.mk b/package/libvpx/libvpx.mk
index 73fe2057de..aaef708416 100644
--- a/package/libvpx/libvpx.mk
+++ b/package/libvpx/libvpx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBVPX_VERSION = 1.8.0
+LIBVPX_VERSION = 1.8.1
 LIBVPX_SITE = $(call github,webmproject,libvpx,v$(LIBVPX_VERSION))
 LIBVPX_LICENSE = BSD-3-Clause
 LIBVPX_LICENSE_FILES = LICENSE PATENTS
