From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 3 Aug 2016 11:56:52 +0100
Subject: [Buildroot] [PATCH 3/3] libcurl: bump version to 7.50.1
In-Reply-To: <1470221812-32709-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1470221812-32709-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <1470221812-32709-3-git-send-email-Vincent.Riera@imgtec.com>
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
index 9e7f7ac..ff0026d 100644
--- a/package/libcurl/libcurl.hash
+++ b/package/libcurl/libcurl.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256 608dfe2db77f48db792c387e7791aca55a25f0b42385707ad927164199ecfa9a  curl-7.50.0.tar.bz2
+sha256 3c12c5f54ccaa1d40abc65d672107dcc75d3e1fcb38c267484334280096e5156  curl-7.50.1.tar.bz2
diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index f899e2e..4a018b8 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCURL_VERSION = 7.50.0
+LIBCURL_VERSION = 7.50.1
 LIBCURL_SOURCE = curl-$(LIBCURL_VERSION).tar.bz2
 LIBCURL_SITE = http://curl.haxx.se/download
 LIBCURL_DEPENDENCIES = host-pkgconf \
-- 
2.7.3
