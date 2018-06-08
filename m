From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Fri,  8 Jun 2018 15:59:25 -0700
Subject: [Buildroot] [RFC PATCH 1/8] atk: bump to version 2.25.2
In-Reply-To: <20180608225932.13127-1-joseph.kogut@gmail.com>
References: <20180608225932.13127-1-joseph.kogut@gmail.com>
Message-ID: <20180608225932.13127-2-joseph.kogut@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
---
 package/atk/atk.hash | 4 ++--
 package/atk/atk.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/atk/atk.hash b/package/atk/atk.hash
index 12c98706dd..d6c61a22f4 100644
--- a/package/atk/atk.hash
+++ b/package/atk/atk.hash
@@ -1,2 +1,2 @@
-# From http://ftp.gnome.org/pub/gnome/sources/atk/2.22/atk-2.22.0.sha256sum
-sha256 d349f5ca4974c9c76a4963e5b254720523b0c78672cbc0e1a3475dbd9b3d44b6 atk-2.22.0.tar.xz
+# From http://ftp.acc.umu.se/pub/gnome/sources/atk/2.25/atk-2.25.2.sha256sum
+sha256 75ac1f63e845f895dec8d72d4645ef5f362e32c921cc78987f2f19c2ce212a24 atk-2.25.2.tar.xz
diff --git a/package/atk/atk.mk b/package/atk/atk.mk
index 88cf5fbc0a..a50cb9f0ee 100644
--- a/package/atk/atk.mk
+++ b/package/atk/atk.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-ATK_VERSION_MAJOR = 2.22
-ATK_VERSION = $(ATK_VERSION_MAJOR).0
+ATK_VERSION_MAJOR = 2.25
+ATK_VERSION = $(ATK_VERSION_MAJOR).2
 ATK_SOURCE = atk-$(ATK_VERSION).tar.xz
 ATK_SITE = http://ftp.gnome.org/pub/gnome/sources/atk/$(ATK_VERSION_MAJOR)
 ATK_LICENSE = LGPL-2.0+
-- 
2.17.1
