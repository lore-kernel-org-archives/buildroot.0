From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Sun, 14 Jun 2015 15:07:02 +0200
Subject: [Buildroot] [PATCH 1/2] package/libupnpp: bump to version 0.11.0
Message-ID: <1434287223-19653-1-git-send-email-joerg.krause@embedded.rocks>
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
index 19541cf..ae935c1 100644
--- a/package/libupnpp/libupnpp.hash
+++ b/package/libupnpp/libupnpp.hash
@@ -1,2 +1,2 @@
-# Hashes from: http://www.lesbonscomptes.com/upmpdcli/downloads/libupnpp-0.8.6.tar.gz.sha256
-sha256 cdacf083100552a5aad57b30608e85fbcc222f4acf920c2d09d28cb75af2cdf8  libupnpp-0.8.6.tar.gz
+# Hashes from: http://www.lesbonscomptes.com/upmpdcli/downloads/libupnpp-0.11.0.tar.gz.sha256
+sha256 e7ceab4313226010b6064f65aa156fa04c25af4d5ae4c23a18303e2034fbca05  libupnpp-0.11.0.tar.gz
diff --git a/package/libupnpp/libupnpp.mk b/package/libupnpp/libupnpp.mk
index defc16a..caf61af 100644
--- a/package/libupnpp/libupnpp.mk
+++ b/package/libupnpp/libupnpp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUPNPP_VERSION = 0.8.6
+LIBUPNPP_VERSION = 0.11.0
 LIBUPNPP_SITE = http://www.lesbonscomptes.com/upmpdcli/downloads
 LIBUPNPP_LICENSE = GPLv2+
 LIBUPNPP_LICENSE_FILES = COPYING
-- 
2.4.3
