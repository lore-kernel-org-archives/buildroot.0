From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Tue, 12 Jan 2021 21:09:31 +0100
Subject: [Buildroot] [PATCH 1/1] package/libupnpp: bump to version 0.20.2
Message-ID: <20210112200931.236875-1-joerg.krause@embedded.rocks>
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
index f94ebc8e43..ae79cfe8a7 100644
--- a/package/libupnpp/libupnpp.hash
+++ b/package/libupnpp/libupnpp.hash
@@ -1,5 +1,5 @@
-# Hash from: http://www.lesbonscomptes.com/upmpdcli/downloads/libupnpp-0.20.1.tar.gz.sha256
-sha256  d4da986aeaa7124a1732ce3383b6ac8f28e20cab10f1916709f39e5499ae9c38  libupnpp-0.20.1.tar.gz
+# Hash from: http://www.lesbonscomptes.com/upmpdcli/downloads/libupnpp-0.20.2.tar.gz.sha256
+sha256  48c2cc7b5a3eef55f4dddda88d8676ed11f7e88f1d6680c8458512067a0e0a11  libupnpp-0.20.2.tar.gz
 
 # Hash for license file:
 sha256  00a89b0d18aacd4114decf79122db87bf35bddaf2bc50e383c9c9f4c263390b2  COPYING
diff --git a/package/libupnpp/libupnpp.mk b/package/libupnpp/libupnpp.mk
index 1337e951a7..4ee98b01cc 100644
--- a/package/libupnpp/libupnpp.mk
+++ b/package/libupnpp/libupnpp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUPNPP_VERSION = 0.20.1
+LIBUPNPP_VERSION = 0.20.2
 LIBUPNPP_SITE = http://www.lesbonscomptes.com/upmpdcli/downloads
 LIBUPNPP_LICENSE = LGPL-2.1+
 LIBUPNPP_LICENSE_FILES = COPYING
-- 
2.30.0
