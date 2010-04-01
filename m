From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 1 Apr 2010 17:44:28 +0200
Subject: [Buildroot] [git commit master] iw: needs host-pkg-config
Message-ID: <20100401154535.F3A357FB82@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=259d6fc0e097685a1340ab56e666ab384884bbc2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #1459

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/iw/iw.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/iw/iw.mk b/package/iw/iw.mk
index 89fd604..e6a3418 100644
--- a/package/iw/iw.mk
+++ b/package/iw/iw.mk
@@ -7,7 +7,7 @@
 IW_VERSION = 0.9.19
 IW_SOURCE = iw-$(IW_VERSION).tar.bz2
 IW_SITE = http://wireless.kernel.org/download/iw
-IW_DEPENDENCIES = libnl
+IW_DEPENDENCIES = host-pkg-config libnl
 IW_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 IW_CONFIG = $(IW_DIR)/.config
 IW_MAKE_ENV = PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig" \
-- 
1.6.3.3
