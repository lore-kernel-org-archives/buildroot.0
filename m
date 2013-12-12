From: Axel Lin <axel.lin@ingics.com>
Date: Thu, 12 Dec 2013 08:55:43 +0800
Subject: [Buildroot] [PATCH] wavpack: bump to version 4.70.0
Message-ID: <1386809743.8675.1.camel@phoenix>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also update license file location for 4.70.0.

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 package/wavpack/wavpack.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

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
-- 
1.8.1.2
