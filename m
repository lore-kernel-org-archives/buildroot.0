From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 18 Jun 2015 22:41:32 +0200
Subject: [Buildroot] [git commit] libcurl: bump to version 7.43.0
Message-ID: <20150618204136.8671B81E1E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fc91ffa2f90b759dfa5f438145f8acf55f6db0d8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Bump to version 7.43.0
- Update hash file

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Acked-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libcurl/libcurl.hash |    2 +-
 package/libcurl/libcurl.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libcurl/libcurl.hash b/package/libcurl/libcurl.hash
index 59a458e..ee68922 100644
--- a/package/libcurl/libcurl.hash
+++ b/package/libcurl/libcurl.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	e2905973391ec2dfd7743a8034ad10eeb58dab8b3a297e7892a41a7999cac887	curl-7.42.1.tar.bz2
+sha256  baa654a1122530483ccc1c58cc112fec3724a82c11c6a389f1e6a37dc8858df9  curl-7.43.0.tar.bz2
diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index 0ce2dfd..29a888c 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCURL_VERSION = 7.42.1
+LIBCURL_VERSION = 7.43.0
 LIBCURL_SOURCE = curl-$(LIBCURL_VERSION).tar.bz2
 LIBCURL_SITE = http://curl.haxx.se/download
 LIBCURL_DEPENDENCIES = host-pkgconf \
