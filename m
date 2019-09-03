From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 03 Sep 2019 13:40:36 -0000
Subject: [Buildroot] [git commit] package/libestr: bump to version 0.1.11
Message-ID: <20190903133619.82DE38A5E7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0213feb8231daceb88d09a47ad915066447a9f95
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

See https://libestr.adiscon.com/uncategorized/libestr-0-1-11-2/

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libestr/libestr.hash | 4 ++--
 package/libestr/libestr.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libestr/libestr.hash b/package/libestr/libestr.hash
index dcb504d3e1..6445d01081 100644
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
index dcd209474c..30960f7257 100644
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
