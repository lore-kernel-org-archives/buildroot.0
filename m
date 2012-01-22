From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 22 Jan 2012 21:36:51 +0100
Subject: [Buildroot] [git commit] iw: bump to 3.3
Message-ID: <20120122215542.C2D1C90358@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e098308f8dbc013c9749cc242fe5be0d23c882b0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/iw/iw.mk |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/iw/iw.mk b/package/iw/iw.mk
index d89fc6c..38bb125 100644
--- a/package/iw/iw.mk
+++ b/package/iw/iw.mk
@@ -4,8 +4,9 @@
 #
 #############################################################
 
-IW_VERSION = a82abc2cac9dea7def53070565201145c76c8c6c
-IW_SITE = git://git.sipsolutions.net/iw.git
+IW_VERSION = 3.3
+IW_SOURCE = iw-$(IW_VERSION).tar.bz2
+IW_SITE = http://wireless.kernel.org/download/iw
 IW_DEPENDENCIES = host-pkg-config libnl
 IW_CONFIG = $(IW_DIR)/.config
 IW_MAKE_ENV = PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig" \
