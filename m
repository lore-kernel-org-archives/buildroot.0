From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Mon,  4 Nov 2019 15:01:51 +0100
Subject: [Buildroot] [PATCH] package/libupnpp: bump to version 0.17.2
In-Reply-To: <20191104140151.14746-1-joerg.krause@embedded.rocks>
References: <20191104140151.14746-1-joerg.krause@embedded.rocks>
Message-ID: <20191104140151.14746-2-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libupnpp 0.17.2 requires libupnp >= 1.8.5.

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/libupnpp/libupnpp.hash | 4 ++--
 package/libupnpp/libupnpp.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libupnpp/libupnpp.hash b/package/libupnpp/libupnpp.hash
index 24f32894f4..993dbc89ae 100644
--- a/package/libupnpp/libupnpp.hash
+++ b/package/libupnpp/libupnpp.hash
@@ -1,5 +1,5 @@
-# Hashes from: http://www.lesbonscomptes.com/upmpdcli/downloads/libupnpp-0.17.1.tar.gz.sha256
-sha256  90403b55583e932a9a04905a01bf452016a56aecbeade5c9e1454a5fbb6f01b0  libupnpp-0.17.1.tar.gz
+# Hashes from: http://www.lesbonscomptes.com/upmpdcli/downloads/libupnpp-0.17.2.tar.gz.sha256
+sha256  5abaaf353a1e9c3482d61ef2627b650285d59f27c1ee60d35b8951952261374f  libupnpp-0.17.2.tar.gz
 
 # Hash for license file:
 sha256  00a89b0d18aacd4114decf79122db87bf35bddaf2bc50e383c9c9f4c263390b2  COPYING
diff --git a/package/libupnpp/libupnpp.mk b/package/libupnpp/libupnpp.mk
index 53a64bded8..53dc9f6c36 100644
--- a/package/libupnpp/libupnpp.mk
+++ b/package/libupnpp/libupnpp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUPNPP_VERSION = 0.17.1
+LIBUPNPP_VERSION = 0.17.2
 LIBUPNPP_SITE = http://www.lesbonscomptes.com/upmpdcli/downloads
 LIBUPNPP_LICENSE = LGPL-2.1+
 LIBUPNPP_LICENSE_FILES = COPYING
-- 
2.23.0
