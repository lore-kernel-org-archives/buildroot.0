From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 21 May 2017 14:04:17 +0200
Subject: [Buildroot] [PATCH/next] package/minidlna: bump version to 1.2.0
Message-ID: <20170521120417.18504-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Added locally computed sha256 hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/minidlna/minidlna.hash | 8 +++++---
 package/minidlna/minidlna.mk   | 2 +-
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/minidlna/minidlna.hash b/package/minidlna/minidlna.hash
index d1ed4b918..8f6b1cc2d 100644
--- a/package/minidlna/minidlna.hash
+++ b/package/minidlna/minidlna.hash
@@ -1,3 +1,5 @@
-# From http://sourceforge.net/projects/minidlna/files/minidlna/1.1.5/
-md5	1970e553a1eb8a3e7e302e2ce292cbc4	minidlna-1.1.5.tar.gz
-sha1	8185337621f5f9111118d8a4bca1e8cfcdd19505	minidlna-1.1.5.tar.gz
+# From http://sourceforge.net/projects/minidlna/files/minidlna/1.2.0/
+md5 5f59700431e9f66198238deeb4e0d0de  minidlna-1.2.0.tar.gz
+sha1 700e07440167ddef44b06aa59cabe5e3abe612f6  minidlna-1.2.0.tar.gz
+# Locally computed
+sha256 8d34436580c4c44be25976d5e46bc5b71af69bf441c4492774eac001164c4433  minidlna-1.2.0.tar.gz
diff --git a/package/minidlna/minidlna.mk b/package/minidlna/minidlna.mk
index 40f918c3e..4fa55454c 100644
--- a/package/minidlna/minidlna.mk
+++ b/package/minidlna/minidlna.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MINIDLNA_VERSION = 1.1.5
+MINIDLNA_VERSION = 1.2.0
 MINIDLNA_SITE = http://downloads.sourceforge.net/project/minidlna/minidlna/$(MINIDLNA_VERSION)
 MINIDLNA_LICENSE = GPL-2.0, BSD-3-Clause
 MINIDLNA_LICENSE_FILES = COPYING LICENCE.miniupnpd
-- 
2.11.0
