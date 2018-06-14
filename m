From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Thu, 14 Jun 2018 15:48:12 -0700
Subject: [Buildroot] [RFC PATCH v4 1/9] atk: bump to version 2.28.1
In-Reply-To: <20180614224820.27126-1-joseph.kogut@gmail.com>
References: <20180610205417.13963-1-joseph.kogut@gmail.com>
 <20180614224820.27126-1-joseph.kogut@gmail.com>
Message-ID: <20180614224820.27126-2-joseph.kogut@gmail.com>
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
index 12c98706dd..80aeecaee9 100644
--- a/package/atk/atk.hash
+++ b/package/atk/atk.hash
@@ -1,2 +1,2 @@
-# From http://ftp.gnome.org/pub/gnome/sources/atk/2.22/atk-2.22.0.sha256sum
-sha256 d349f5ca4974c9c76a4963e5b254720523b0c78672cbc0e1a3475dbd9b3d44b6 atk-2.22.0.tar.xz
+# From http://ftp.gnome.org/pub/gnome/sources/atk/2.28/atk-2.28.1.sha256sum
+sha256 cd3a1ea6ecc268a2497f0cd018e970860de24a6d42086919d6bf6c8e8d53f4fc atk-2.28.1.tar.xz
diff --git a/package/atk/atk.mk b/package/atk/atk.mk
index 88cf5fbc0a..64950bfd08 100644
--- a/package/atk/atk.mk
+++ b/package/atk/atk.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-ATK_VERSION_MAJOR = 2.22
-ATK_VERSION = $(ATK_VERSION_MAJOR).0
+ATK_VERSION_MAJOR = 2.28
+ATK_VERSION = $(ATK_VERSION_MAJOR).1
 ATK_SOURCE = atk-$(ATK_VERSION).tar.xz
 ATK_SITE = http://ftp.gnome.org/pub/gnome/sources/atk/$(ATK_VERSION_MAJOR)
 ATK_LICENSE = LGPL-2.0+
-- 
2.17.1
