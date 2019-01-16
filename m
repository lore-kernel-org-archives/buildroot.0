From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Wed, 16 Jan 2019 22:02:29 +0100
Subject: [Buildroot] [PATCH 2/2] package/upmpdcli: bump to version 1.4.0
In-Reply-To: <20190116210229.4992-1-joerg.krause@embedded.rocks>
References: <20190116210229.4992-1-joerg.krause@embedded.rocks>
Message-ID: <20190116210229.4992-2-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

upmpdcli switched license from GPL-2.0+ to LGPL-2.1+, therefore update
the hash file for the license file "COPYING".

Note, that upmpdcli depends on libupnpp 0.17.0.

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/upmpdcli/upmpdcli.hash | 6 +++---
 package/upmpdcli/upmpdcli.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/upmpdcli/upmpdcli.hash b/package/upmpdcli/upmpdcli.hash
index c59655c9fe..cbd12fe293 100644
--- a/package/upmpdcli/upmpdcli.hash
+++ b/package/upmpdcli/upmpdcli.hash
@@ -1,5 +1,5 @@
-# From http://www.lesbonscomptes.com/upmpdcli/downloads/upmpdcli-1.2.16.tar.gz.sha256:
-sha256  b0dfd33cd5c1c2e4f770660c12d7303b6d8b3fdca4f63530c6a235ce279a9d98  upmpdcli-1.2.16.tar.gz
+# From http://www.lesbonscomptes.com/upmpdcli/downloads/upmpdcli-1.4.0.tar.gz.sha256:
+sha256  28742910fa16b72f0c4e5b7dc561f59aa7f1a5fdd3e8e4f72f359d2e4af90d35  upmpdcli-1.4.0.tar.gz
 
 # Hash for license file:
-sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
+sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/upmpdcli/upmpdcli.mk b/package/upmpdcli/upmpdcli.mk
index 069b143998..d88caac78b 100644
--- a/package/upmpdcli/upmpdcli.mk
+++ b/package/upmpdcli/upmpdcli.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-UPMPDCLI_VERSION = 1.2.16
+UPMPDCLI_VERSION = 1.4.0
 UPMPDCLI_SITE = http://www.lesbonscomptes.com/upmpdcli/downloads
-UPMPDCLI_LICENSE = GPL-2.0+
+UPMPDCLI_LICENSE = LGPL-2.1+
 UPMPDCLI_LICENSE_FILES = COPYING
 UPMPDCLI_DEPENDENCIES = host-pkgconf libmpdclient libupnpp libmicrohttpd jsoncpp
 
-- 
2.20.1
