From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu,  8 Aug 2019 10:03:23 +0200
Subject: [Buildroot] [PATCH 2/4] package/libfm: bump to version 1.3.1
In-Reply-To: <20190808080325.4182-1-fontaine.fabrice@gmail.com>
References: <20190808080325.4182-1-fontaine.fabrice@gmail.com>
Message-ID: <20190808080325.4182-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libfm/libfm.hash | 4 ++--
 package/libfm/libfm.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libfm/libfm.hash b/package/libfm/libfm.hash
index 71befc355e..d63a436119 100644
--- a/package/libfm/libfm.hash
+++ b/package/libfm/libfm.hash
@@ -1,6 +1,6 @@
 # From https://sourceforge.net/projects/pcmanfm/files/PCManFM%20%2B%20Libfm%20%28tarball%20release%29/LibFM/
-md5 02a024714d51e0d37afc7bd596a44f3b  libfm-1.3.0.2.tar.xz
-sha1 aa7f73987866e557b74b8a28d0fea339d53899b6  libfm-1.3.0.2.tar.xz
+md5 c15ecd2c9317e2c385cd3f046d0b61ba  libfm-1.3.1.tar.xz
+sha1 29539f50acd5c00a00362adffd532053b0688e66  libfm-1.3.1.tar.xz
 
 # Hash for license files:
 sha256 d8c320ffc0030d1b096ae4732b50d2b811cf95e9a9b7377c1127b2563e0a0388  COPYING
diff --git a/package/libfm/libfm.mk b/package/libfm/libfm.mk
index 292a0ab5d8..47f01b17cb 100644
--- a/package/libfm/libfm.mk
+++ b/package/libfm/libfm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBFM_VERSION = 1.3.0.2
+LIBFM_VERSION = 1.3.1
 LIBFM_SOURCE = libfm-$(LIBFM_VERSION).tar.xz
 LIBFM_SITE = http://sourceforge.net/projects/pcmanfm/files
 LIBFM_DEPENDENCIES = menu-cache libglib2 cairo
-- 
2.20.1
