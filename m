From: Stephan Hoffmann <sho@relinux.de>
Date: Fri,  7 Dec 2012 11:29:23 +0100
Subject: [Buildroot] [PATCH] tslib: add license info
Message-ID: <1354876163-30452-1-git-send-email-sho@relinux.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Stephan Hoffmann <sho@relinux.de>
---
 package/tslib/tslib.mk |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/tslib/tslib.mk b/package/tslib/tslib.mk
index b10b5ec..9b51015 100644
--- a/package/tslib/tslib.mk
+++ b/package/tslib/tslib.mk
@@ -5,6 +5,9 @@
 #############################################################
 TSLIB_VERSION = 412d99d
 TSLIB_SITE = http://github.com/kergoth/tslib/tarball/master
+TSLIB_LICENSE = LGPLv2
+TSLIB_LICENSE_FILES = COPYING
+
 TSLIB_AUTORECONF = YES
 TSLIB_INSTALL_STAGING = YES
 TSLIB_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) LDFLAGS=-L$(STAGING_DIR)/usr/lib install
-- 
1.7.0.4
