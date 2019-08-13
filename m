From: Pierre-Jean Texier <pjtexier@koncepto.io>
Date: Tue, 13 Aug 2019 18:04:57 +0200
Subject: [Buildroot] [PATCH] package/libestr: bump to version 0.1.11
Message-ID: <1565712297-504-1-git-send-email-pjtexier@koncepto.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

See https://libestr.adiscon.com/uncategorized/libestr-0-1-11-2/

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 package/libestr/libestr.hash | 4 ++--
 package/libestr/libestr.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libestr/libestr.hash b/package/libestr/libestr.hash
index dcb504d..6445d01 100644
--- a/package/libestr/libestr.hash
+++ b/package/libestr/libestr.hash
@@ -1,5 +1,5 @@
-# From http://libestr.adiscon.com/download/libestr-0-1-10/
-sha256	bd655e126e750edd18544b88eb1568d200a424a0c23f665eb14bbece07ac703c	libestr-0.1.10.tar.gz
+# From http://libestr.adiscon.com/download/libestr-0-1-11/
+sha256	46632b2785ff4a231dcf241eeb0dcb5fc0c7d4da8ee49cf5687722cdbe8b2024	libestr-0.1.11.tar.gz
 
 # Hash for license file:
 sha256	835b4793da5cbb8965fbd63905b55a4cb4310b7d1b882077d23066b08f901ff8	COPYING
diff --git a/package/libestr/libestr.mk b/package/libestr/libestr.mk
index dcd2094..30960f7 100644
--- a/package/libestr/libestr.mk
+++ b/package/libestr/libestr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBESTR_VERSION = 0.1.10
+LIBESTR_VERSION = 0.1.11
 LIBESTR_SITE = http://libestr.adiscon.com/files/download
 LIBESTR_LICENSE = LGPL-2.1+
 LIBESTR_LICENSE_FILES = COPYING
-- 
2.7.4
