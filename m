From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Wed, 18 Jan 2012 10:31:31 +0100
Subject: [Buildroot] [PATCH] iw: bump to 3.3
Message-ID: <1326879091-31187-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
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
-- 
1.7.1.1
