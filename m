From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Mon, 29 May 2017 12:20:11 +0200
Subject: [Buildroot] [PATCH 2/2] upmpdcli: bump to version 1.2.14
In-Reply-To: <20170529102011.25175-1-joerg.krause@embedded.rocks>
References: <20170529102011.25175-1-joerg.krause@embedded.rocks>
Message-ID: <20170529102011.25175-2-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/upmpdcli/upmpdcli.hash | 4 ++--
 package/upmpdcli/upmpdcli.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/upmpdcli/upmpdcli.hash b/package/upmpdcli/upmpdcli.hash
index bcd78318c..b192d0e18 100644
--- a/package/upmpdcli/upmpdcli.hash
+++ b/package/upmpdcli/upmpdcli.hash
@@ -1,2 +1,2 @@
-# From http://www.lesbonscomptes.com/upmpdcli/downloads/upmpdcli-1.2.12.tar.gz.sha256:
-sha256  20d97c2e5ff6911e1e1538edb1487823479802cba6bd4f4c4a74035edf61cb26  upmpdcli-1.2.12.tar.gz
+# From http://www.lesbonscomptes.com/upmpdcli/downloads/upmpdcli-1.2.14.tar.gz.sha256:
+sha256  fbfb392deec0b353704f8067d9863535dc2512f719d3305dbd73452ca59ec2fe  upmpdcli-1.2.14.tar.gz
diff --git a/package/upmpdcli/upmpdcli.mk b/package/upmpdcli/upmpdcli.mk
index eabc04a21..cc9f6528f 100644
--- a/package/upmpdcli/upmpdcli.mk
+++ b/package/upmpdcli/upmpdcli.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UPMPDCLI_VERSION = 1.2.12
+UPMPDCLI_VERSION = 1.2.14
 UPMPDCLI_SITE = http://www.lesbonscomptes.com/upmpdcli/downloads
 UPMPDCLI_LICENSE = GPL-2.0+
 UPMPDCLI_LICENSE_FILES = COPYING
-- 
2.13.0
