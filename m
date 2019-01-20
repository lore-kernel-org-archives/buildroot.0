From: Gilles Talis <gilles.talis@gmail.com>
Date: Sun, 20 Jan 2019 13:02:21 +0100
Subject: [Buildroot] [PATCH] ocrad: bump to version 0.27
Message-ID: <1547985741-5377-1-git-send-email-gilles.talis@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
---
 package/ocrad/ocrad.hash | 2 +-
 package/ocrad/ocrad.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ocrad/ocrad.hash b/package/ocrad/ocrad.hash
index 5cde4d3..7ae38c3 100644
--- a/package/ocrad/ocrad.hash
+++ b/package/ocrad/ocrad.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking pgp signature
-sha256 c383d37869baa0990d38d38836d4d567e9e2862aa0cd704868b62dafeac18e3c  ocrad-0.26.tar.lz
+sha256 a9bfe67e9a040907aff5640dca56392476b6a89e48e37dc94ba846c5b6733b36  ocrad-0.27.tar.lz
 sha256 3d77c1a58fbde5ddba612d1fe09965e20a3804953eca12e8c1892298bb8a5eef  COPYING
diff --git a/package/ocrad/ocrad.mk b/package/ocrad/ocrad.mk
index 94020d2..e037a08 100644
--- a/package/ocrad/ocrad.mk
+++ b/package/ocrad/ocrad.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OCRAD_VERSION = 0.26
+OCRAD_VERSION = 0.27
 OCRAD_SOURCE = ocrad-$(OCRAD_VERSION).tar.lz
 OCRAD_SITE = $(BR2_GNU_MIRROR)/ocrad
 OCRAD_LICENSE = GPL-3.0+
-- 
2.7.4
