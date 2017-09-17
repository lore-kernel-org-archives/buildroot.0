From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 17 Sep 2017 10:27:26 +0200
Subject: [Buildroot] [PATCH 1/2] package/libfm: bump version to 1.2.5
Message-ID: <20170917082727.28462-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libfm/libfm.hash | 4 ++--
 package/libfm/libfm.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libfm/libfm.hash b/package/libfm/libfm.hash
index 8a78adebb4..69c4c31f6d 100644
--- a/package/libfm/libfm.hash
+++ b/package/libfm/libfm.hash
@@ -1,3 +1,3 @@
 # From https://sourceforge.net/projects/pcmanfm/files/PCManFM%20%2B%20Libfm%20%28tarball%20release%29/LibFM/
-md5	74997d75e7e87dc73398746fd373bf52	libfm-1.2.4.tar.xz
-sha1	2f8183389c8e74edb15c6c8ab260df5dd39f3b2d	libfm-1.2.4.tar.xz
+md5 a1ba9ae5e920f38b647dd511edd6c807  libfm-1.2.5.tar.xz
+sha1 5887aa4e85ee0964e7da67368136849957afd5d6  libfm-1.2.5.tar.xz
diff --git a/package/libfm/libfm.mk b/package/libfm/libfm.mk
index 36d8b574e0..c49cd3e633 100644
--- a/package/libfm/libfm.mk
+++ b/package/libfm/libfm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBFM_VERSION = 1.2.4
+LIBFM_VERSION = 1.2.5
 LIBFM_SOURCE = libfm-$(LIBFM_VERSION).tar.xz
 LIBFM_SITE = http://sourceforge.net/projects/pcmanfm/files
 LIBFM_DEPENDENCIES = menu-cache libglib2 cairo
-- 
2.11.0
