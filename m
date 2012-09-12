From: Mark Jackson <mpfj-list@mimc.co.uk>
Date: Wed, 12 Sep 2012 10:24:05 +0100
Subject: [Buildroot] [PATCH] iw: add license information
Message-ID: <505054B5.3080000@mimc.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Mark Jackson <mpfj@newflow.co.uk>
---
 package/iw/iw.mk |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/iw/iw.mk b/package/iw/iw.mk
index 9c68093..ba1ab30 100644
--- a/package/iw/iw.mk
+++ b/package/iw/iw.mk
@@ -7,6 +7,8 @@
 IW_VERSION = 3.6
 IW_SOURCE = iw-$(IW_VERSION).tar.bz2
 IW_SITE = http://wireless.kernel.org/download/iw
+IW_LICENSE = iw license
+IW_LICENSE_FILES = COPYING
 IW_DEPENDENCIES = host-pkg-config libnl
 IW_CONFIG = $(IW_DIR)/.config
 IW_MAKE_ENV = PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig" \
-- 
1.7.9.5
