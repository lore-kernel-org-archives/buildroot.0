From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 31 May 2016 10:48:49 +0100
Subject: [Buildroot] [PATCH] libcurl: security bump version to 7.49.1
Message-ID: <1464688129-14079-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes CVE-2016-4802, https://curl.haxx.se/docs/adv_20160530.html

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/libcurl/libcurl.hash | 2 +-
 package/libcurl/libcurl.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libcurl/libcurl.hash b/package/libcurl/libcurl.hash
index f1f2ee5..f9b90c0 100644
--- a/package/libcurl/libcurl.hash
+++ b/package/libcurl/libcurl.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256 14f44ed7b5207fea769ddb2c31bd9e720d37312e1c02315def67923a4a636078  curl-7.49.0.tar.bz2
+sha256 eb63cec4bef692eab9db459033f409533e6d10e20942f4b060b32819e81885f1  curl-7.49.1.tar.bz2
diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index 60c80c8..942c677 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCURL_VERSION = 7.49.0
+LIBCURL_VERSION = 7.49.1
 LIBCURL_SOURCE = curl-$(LIBCURL_VERSION).tar.bz2
 LIBCURL_SITE = http://curl.haxx.se/download
 LIBCURL_DEPENDENCIES = host-pkgconf \
-- 
2.7.3
