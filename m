From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 3 Jul 2017 14:55:43 +0200
Subject: [Buildroot] [git commit] tslib: use SPDX identifiers for licenses
	in use
Message-ID: <20170703125436.4D6207FA44@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=56ed4a1ef20aea9bbf46c8c17cb275e3173d5acf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: License is GPL-2.0+ / LGPL-2.1+]
Signed-off-by: Martin Kepplinger <martink@posteo.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tslib/tslib.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/tslib/tslib.mk b/package/tslib/tslib.mk
index 91ba9db..5190465 100644
--- a/package/tslib/tslib.mk
+++ b/package/tslib/tslib.mk
@@ -7,7 +7,7 @@
 TSLIB_VERSION = 1.11
 TSLIB_SITE = https://github.com/kergoth/tslib/releases/download/$(TSLIB_VERSION)
 TSLIB_SOURCE = tslib-$(TSLIB_VERSION).tar.xz
-TSLIB_LICENSE = GPL, LGPL
+TSLIB_LICENSE = GPL-2.0+ (programs), LGPL-2.1+ (libraries)
 TSLIB_LICENSE_FILES = COPYING
 
 TSLIB_INSTALL_STAGING = YES
