From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Thu, 21 Jul 2016 12:30:33 +0100
Subject: [Buildroot] [PATCH] libcurl: bump version to 7.50.0
Message-ID: <1469100633-54298-1-git-send-email-Vincent.Riera@imgtec.com>
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
index f9b90c0..9e7f7ac 100644
--- a/package/libcurl/libcurl.hash
+++ b/package/libcurl/libcurl.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256 eb63cec4bef692eab9db459033f409533e6d10e20942f4b060b32819e81885f1  curl-7.49.1.tar.bz2
+sha256 608dfe2db77f48db792c387e7791aca55a25f0b42385707ad927164199ecfa9a  curl-7.50.0.tar.bz2
diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index 942c677..f899e2e 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCURL_VERSION = 7.49.1
+LIBCURL_VERSION = 7.50.0
 LIBCURL_SOURCE = curl-$(LIBCURL_VERSION).tar.bz2
 LIBCURL_SITE = http://curl.haxx.se/download
 LIBCURL_DEPENDENCIES = host-pkgconf \
-- 
2.7.3
