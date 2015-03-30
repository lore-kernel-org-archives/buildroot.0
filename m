From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Mon, 30 Mar 2015 15:30:44 +0200
Subject: [Buildroot] [PATCH 1/1] package/nodejs: Security bump to version
	0.10.38
Message-ID: <1427722244-11737-1-git-send-email-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Version 0.10.38 upgrades OpenSSL to version 1.0.1m, which includes fixes for
several CVEs:
  - CVE-2015-0204
  - CVE-2015-0286
  - CVE-2015-0287
  - CVE-2015-0289
  - CVE-2015-0292
  - CVE-2015-0293
  - CVE-2015-0209
  - CVE-2015-0288

Version 0.10.37 comes with a fix for CVE-2015-0278.

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/nodejs/nodejs.hash | 4 ++--
 package/nodejs/nodejs.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/nodejs/nodejs.hash b/package/nodejs/nodejs.hash
index 5b868e9..792ebc1 100644
--- a/package/nodejs/nodejs.hash
+++ b/package/nodejs/nodejs.hash
@@ -1,2 +1,2 @@
-# From upstream URL: http://nodejs.org/dist/v0.10.36/SHASUMS256.txt
-sha256	b9d7d1d0294bce46686b13a05da6fc5b1e7743b597544aa888e8e64a9f178c81  node-v0.10.36.tar.gz
+# From upstream URL: http://nodejs.org/dist/v0.10.38/SHASUMS256.txt
+sha256	513da8ed5e48abefdfab664f1cabc160238d314a0481148804aff8fc6552b78b  node-v0.10.38.tar.gz
diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index 89faa6c..e8a2c27 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NODEJS_VERSION = 0.10.36
+NODEJS_VERSION = 0.10.38
 NODEJS_SOURCE = node-v$(NODEJS_VERSION).tar.gz
 NODEJS_SITE = http://nodejs.org/dist/v$(NODEJS_VERSION)
 NODEJS_DEPENDENCIES = host-python host-nodejs zlib \
-- 
2.3.4
