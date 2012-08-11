From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Sat, 11 Aug 2012 16:10:21 -0400
Subject: [Buildroot] [PATCH 11/17] libpng: add license info
In-Reply-To: <1344715827-9452-1-git-send-email-danomimanchego123@gmail.com>
References: <1344715827-9452-1-git-send-email-danomimanchego123@gmail.com>
Message-ID: <1344715827-9452-11-git-send-email-danomimanchego123@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
---
 package/libpng/libpng.mk |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libpng/libpng.mk b/package/libpng/libpng.mk
index 6edabc4..1c1a087 100644
--- a/package/libpng/libpng.mk
+++ b/package/libpng/libpng.mk
@@ -8,6 +8,8 @@ LIBPNG_VERSION = 1.4.12
 LIBPNG_SERIES = 14
 LIBPNG_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/project/libpng/libpng$(LIBPNG_SERIES)/$(LIBPNG_VERSION)
 LIBPNG_SOURCE = libpng-$(LIBPNG_VERSION).tar.bz2
+LIBPNG_LICENSE = libpng license
+LIBPNG_LICENSE_FILES = LICENSE
 LIBPNG_INSTALL_STAGING = YES
 LIBPNG_DEPENDENCIES = host-pkg-config zlib
 
-- 
1.7.9.5
