From: Thomas Huth <huth@tuxfamily.org>
Date: Fri, 20 Sep 2019 21:32:36 +0200
Subject: [Buildroot] [PATCH] package/ncurses: License information is in a
 separate file
Message-ID: <20190920193236.15884-1-huth@tuxfamily.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The recent versions of ncurses now have the license information
in a separate file called COPYING.

Signed-off-by: Thomas Huth <huth@tuxfamily.org>
---
 package/ncurses/ncurses.hash | 2 +-
 package/ncurses/ncurses.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ncurses/ncurses.hash b/package/ncurses/ncurses.hash
index cb6ef6b863..123256bf94 100644
--- a/package/ncurses/ncurses.hash
+++ b/package/ncurses/ncurses.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
 sha256	aa057eeeb4a14d470101eff4597d5833dcef5965331be3528c08d99cebaa0d17	ncurses-6.1.tar.gz
 # Locally computed
-sha256 3c7bc1dd475a5e5dcc7bdf13268a0313ff69e3765689444eb95b5893f61b3d1e  README
+sha256	86106f0da1cf5ccfa0f0651665dd1b4515e8edad1c7972780155770548b317d9	COPYING
diff --git a/package/ncurses/ncurses.mk b/package/ncurses/ncurses.mk
index e27598bd42..12fb9812e7 100644
--- a/package/ncurses/ncurses.mk
+++ b/package/ncurses/ncurses.mk
@@ -9,7 +9,7 @@ NCURSES_SITE = $(BR2_GNU_MIRROR)/ncurses
 NCURSES_INSTALL_STAGING = YES
 NCURSES_DEPENDENCIES = host-ncurses
 NCURSES_LICENSE = MIT with advertising clause
-NCURSES_LICENSE_FILES = README
+NCURSES_LICENSE_FILES = COPYING
 NCURSES_CONFIG_SCRIPTS = ncurses$(NCURSES_LIB_SUFFIX)6-config
 
 NCURSES_CONF_OPTS = \
-- 
2.21.0
