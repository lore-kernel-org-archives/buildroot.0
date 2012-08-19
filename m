From: spdawson at gmail.com <spdawson@gmail.com>
Date: Sun, 19 Aug 2012 21:08:43 +0100
Subject: [Buildroot] [PATCH 3/4] zlib: add license information
In-Reply-To: <1345406924-6574-1-git-send-email-spdawson@gmail.com>
References: <1345406924-6574-1-git-send-email-spdawson@gmail.com>
Message-ID: <1345406924-6574-3-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 package/zlib/zlib.mk |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/zlib/zlib.mk b/package/zlib/zlib.mk
index a9d4a8f..2ddab62 100644
--- a/package/zlib/zlib.mk
+++ b/package/zlib/zlib.mk
@@ -7,6 +7,8 @@
 ZLIB_VERSION = 1.2.7
 ZLIB_SOURCE =zlib-$(ZLIB_VERSION).tar.bz2
 ZLIB_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/libpng
+ZLIB_LICENSE = zlib license
+ZLIB_LICENSE_FILES = README
 ZLIB_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PREFER_STATIC_LIB),y)
-- 
1.7.9.5
