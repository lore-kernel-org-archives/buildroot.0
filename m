From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu,  7 Jul 2016 07:10:09 +0200
Subject: [Buildroot] [PATCH 1/1] package/libsndfile: bump version to 1.0.27
Message-ID: <1467868209-32472-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libsndfile/libsndfile.hash | 2 +-
 package/libsndfile/libsndfile.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libsndfile/libsndfile.hash b/package/libsndfile/libsndfile.hash
index 04d091b..a87b7c3 100644
--- a/package/libsndfile/libsndfile.hash
+++ b/package/libsndfile/libsndfile.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	cd6520ec763d1a45573885ecb1f8e4e42505ac12180268482a44b28484a25092	libsndfile-1.0.26.tar.gz
+sha256	a391952f27f4a92ceb2b4c06493ac107896ed6c76be9a613a4731f076d30fac0	libsndfile-1.0.27.tar.gz
diff --git a/package/libsndfile/libsndfile.mk b/package/libsndfile/libsndfile.mk
index 107a356..aaef657 100644
--- a/package/libsndfile/libsndfile.mk
+++ b/package/libsndfile/libsndfile.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBSNDFILE_VERSION = 1.0.26
+LIBSNDFILE_VERSION = 1.0.27
 LIBSNDFILE_SITE = http://www.mega-nerd.com/libsndfile/files
 LIBSNDFILE_INSTALL_STAGING = YES
 LIBSNDFILE_LICENSE = LGPLv2.1+
-- 
2.8.1
