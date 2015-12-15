From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 15 Dec 2015 14:44:45 -0300
Subject: [Buildroot] [PATCH] libsndfile: security bump to version 1.0.26
Message-ID: <1450201485-5400-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
CVE-2014-9496 - SD2 buffer read overflow.
CVE-2014-9756 - file_io.c divide by zero.
CVE-2015-7805 - AIIF heap write overflow.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libsndfile/libsndfile.hash | 2 +-
 package/libsndfile/libsndfile.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libsndfile/libsndfile.hash b/package/libsndfile/libsndfile.hash
index a19c262..04d091b 100644
--- a/package/libsndfile/libsndfile.hash
+++ b/package/libsndfile/libsndfile.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	59016dbd326abe7e2366ded5c344c853829bebfd1702ef26a07ef662d6aa4882	libsndfile-1.0.25.tar.gz
+sha256	cd6520ec763d1a45573885ecb1f8e4e42505ac12180268482a44b28484a25092	libsndfile-1.0.26.tar.gz
diff --git a/package/libsndfile/libsndfile.mk b/package/libsndfile/libsndfile.mk
index 88db576..107a356 100644
--- a/package/libsndfile/libsndfile.mk
+++ b/package/libsndfile/libsndfile.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBSNDFILE_VERSION = 1.0.25
+LIBSNDFILE_VERSION = 1.0.26
 LIBSNDFILE_SITE = http://www.mega-nerd.com/libsndfile/files
 LIBSNDFILE_INSTALL_STAGING = YES
 LIBSNDFILE_LICENSE = LGPLv2.1+
-- 
2.4.10
