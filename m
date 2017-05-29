From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Mon, 29 May 2017 12:20:10 +0200
Subject: [Buildroot] [PATCH 1/2] libupnpp: bump to version 0.15.2
Message-ID: <20170529102011.25175-1-joerg.krause@embedded.rocks>
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
index dde4c4f67..4e759bd47 100644
--- a/package/libupnpp/libupnpp.hash
+++ b/package/libupnpp/libupnpp.hash
@@ -1,2 +1,2 @@
-# Hashes from: http://www.lesbonscomptes.com/upmpdcli/downloads/libupnpp-0.15.1.tar.gz.sha256
-sha256  c558e6285d61485e656bc973511396665b68b1d5cfa34db5fa4e64e0f2026c3a  libupnpp-0.15.1.tar.gz
+# Hashes from: http://www.lesbonscomptes.com/upmpdcli/downloads/libupnpp-0.15.2.tar.gz.sha256
+sha256  3abcc0c951ac37b92b9b1f6d10255a5b54353a1cb43a58d48324c08c6e41a6ab  libupnpp-0.15.2.tar.gz
diff --git a/package/libupnpp/libupnpp.mk b/package/libupnpp/libupnpp.mk
index 52753cfbe..961051c7b 100644
--- a/package/libupnpp/libupnpp.mk
+++ b/package/libupnpp/libupnpp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUPNPP_VERSION = 0.15.1
+LIBUPNPP_VERSION = 0.15.2
 LIBUPNPP_SITE = http://www.lesbonscomptes.com/upmpdcli/downloads
 LIBUPNPP_LICENSE = GPL-2.0+
 LIBUPNPP_LICENSE_FILES = COPYING
-- 
2.13.0
