From: Martin Kepplinger <martink@posteo.de>
Date: Mon,  3 Jul 2017 09:50:08 +0200
Subject: [Buildroot] [PATCH] tslib: use SPDX identifiers for licenses in use
Message-ID: <20170703075008.18255-1-martink@posteo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Martin Kepplinger <martink@posteo.de>
---
 package/tslib/tslib.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/tslib/tslib.mk b/package/tslib/tslib.mk
index 91ba9db39..936243154 100644
--- a/package/tslib/tslib.mk
+++ b/package/tslib/tslib.mk
@@ -7,7 +7,7 @@
 TSLIB_VERSION = 1.11
 TSLIB_SITE = https://github.com/kergoth/tslib/releases/download/$(TSLIB_VERSION)
 TSLIB_SOURCE = tslib-$(TSLIB_VERSION).tar.xz
-TSLIB_LICENSE = GPL, LGPL
+TSLIB_LICENSE = GPL-2.0 (programs), LGPL-2.1 (libraries)
 TSLIB_LICENSE_FILES = COPYING
 
 TSLIB_INSTALL_STAGING = YES
-- 
2.11.0
