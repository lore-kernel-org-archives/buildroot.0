From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Thu, 21 Sep 2017 09:29:15 +0200
Subject: [Buildroot] [PATCH] libupnpp: bump to version 0.16.0
Message-ID: <20170921072915.23996-1-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/libupnpp/libupnpp.hash | 4 ++--
 package/libupnpp/libupnpp.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libupnpp/libupnpp.hash b/package/libupnpp/libupnpp.hash
index c8507409a6..f19e0b5441 100644
--- a/package/libupnpp/libupnpp.hash
+++ b/package/libupnpp/libupnpp.hash
@@ -1,2 +1,2 @@
-# Hashes from: http://www.lesbonscomptes.com/upmpdcli/downloads/libupnpp-0.15.3.tar.gz.sha256
-sha256  c9c5af25bff3d99f0e76296a13e544cc04e70c85623e4c9869a25418caa9e7b7  libupnpp-0.15.3.tar.gz
+# Hashes from: http://www.lesbonscomptes.com/upmpdcli/downloads/libupnpp-0.16.0.tar.gz.sha256
+sha256  b34b179e69c46993cf360da9e85db646b03c15ab2927b19eb70e27bf3c359017  libupnpp-0.16.0.tar.gz
diff --git a/package/libupnpp/libupnpp.mk b/package/libupnpp/libupnpp.mk
index 2e1d72fce1..4755b706d6 100644
--- a/package/libupnpp/libupnpp.mk
+++ b/package/libupnpp/libupnpp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUPNPP_VERSION = 0.15.3
+LIBUPNPP_VERSION = 0.16.0
 LIBUPNPP_SITE = http://www.lesbonscomptes.com/upmpdcli/downloads
 LIBUPNPP_LICENSE = GPL-2.0+
 LIBUPNPP_LICENSE_FILES = COPYING
-- 
2.14.1
