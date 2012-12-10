From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 10 Dec 2012 22:33:24 +0100
Subject: [Buildroot] [git commit] tslib: add license info
Message-ID: <20121210213739.45C3D9A1A6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5611509259e513486dfc35941e80549b081b28fd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: Change to LGPL as pointed out by Arnout]
Signed-off-by: Stephan Hoffmann <sho@relinux.de>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/tslib/tslib.mk |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/tslib/tslib.mk b/package/tslib/tslib.mk
index b10b5ec..c94be7d 100644
--- a/package/tslib/tslib.mk
+++ b/package/tslib/tslib.mk
@@ -5,6 +5,9 @@
 #############################################################
 TSLIB_VERSION = 412d99d
 TSLIB_SITE = http://github.com/kergoth/tslib/tarball/master
+TSLIB_LICENSE = LGPL
+TSLIB_LICENSE_FILES = COPYING
+
 TSLIB_AUTORECONF = YES
 TSLIB_INSTALL_STAGING = YES
 TSLIB_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) LDFLAGS=-L$(STAGING_DIR)/usr/lib install
