From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 12 Dec 2013 16:26:10 +0100
Subject: [Buildroot] [git commit] wavpack: bump to version 4.70.0
Message-ID: <20131212152838.B94829BAE7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=08db3236c4508b2329d3b0ed61d3db54f59fd49c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also update license file location for 4.70.0.

Signed-off-by: Axel Lin <axel.lin@ingics.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wavpack/wavpack.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/wavpack/wavpack.mk b/package/wavpack/wavpack.mk
index a7c703f..c9bae47 100644
--- a/package/wavpack/wavpack.mk
+++ b/package/wavpack/wavpack.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WAVPACK_VERSION = 4.60.1
+WAVPACK_VERSION = 4.70.0
 WAVPACK_SITE = http://www.wavpack.com
 WAVPACK_SOURCE = wavpack-$(WAVPACK_VERSION).tar.bz2
 WAVPACK_INSTALL_STAGING = YES
@@ -12,6 +12,6 @@ WAVPACK_INSTALL_STAGING = YES
 WAVPACK_AUTORECONF = YES
 WAVPACK_DEPENDENCIES = $(if $(BR2_ENABLE_LOCALE),,libiconv)
 WAVPACK_LICENSE = BSD-3c
-WAVPACK_LICENSE_FILES = license.txt
+WAVPACK_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
