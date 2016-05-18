From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 18 May 2016 11:14:37 +0100
Subject: [Buildroot] [PATCH next] libcurl: bump version to 7.49.0
Message-ID: <1463566477-50773-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/libcurl/libcurl.hash | 2 +-
 package/libcurl/libcurl.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libcurl/libcurl.hash b/package/libcurl/libcurl.hash
index a8208de..f1f2ee5 100644
--- a/package/libcurl/libcurl.hash
+++ b/package/libcurl/libcurl.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	864e7819210b586d42c674a1fdd577ce75a78b3dda64c63565abe5aefd72c753	curl-7.48.0.tar.bz2
+sha256 14f44ed7b5207fea769ddb2c31bd9e720d37312e1c02315def67923a4a636078  curl-7.49.0.tar.bz2
diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index d2c39d5..60c80c8 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCURL_VERSION = 7.48.0
+LIBCURL_VERSION = 7.49.0
 LIBCURL_SOURCE = curl-$(LIBCURL_VERSION).tar.bz2
 LIBCURL_SITE = http://curl.haxx.se/download
 LIBCURL_DEPENDENCIES = host-pkgconf \
-- 
2.7.3
