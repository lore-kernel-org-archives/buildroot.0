From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 25 Aug 2017 07:02:49 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/minidlna: bump version to 1.2.1
Message-ID: <20170825050249.31848-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Switched _SITE to https.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/minidlna/minidlna.hash | 8 ++++----
 package/minidlna/minidlna.mk   | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/minidlna/minidlna.hash b/package/minidlna/minidlna.hash
index 8f6b1cc2d..5398506c2 100644
--- a/package/minidlna/minidlna.hash
+++ b/package/minidlna/minidlna.hash
@@ -1,5 +1,5 @@
-# From http://sourceforge.net/projects/minidlna/files/minidlna/1.2.0/
-md5 5f59700431e9f66198238deeb4e0d0de  minidlna-1.2.0.tar.gz
-sha1 700e07440167ddef44b06aa59cabe5e3abe612f6  minidlna-1.2.0.tar.gz
+# From https://sourceforge.net/projects/minidlna/files/minidlna/1.2.1/
+md5 a968d3d84971322471cabda3669cc0f8  minidlna-1.2.1.tar.gz
+sha1 79d0032c7055aefd4c8e5178bc86fbf258d449d2  minidlna-1.2.1.tar.gz
 # Locally computed
-sha256 8d34436580c4c44be25976d5e46bc5b71af69bf441c4492774eac001164c4433  minidlna-1.2.0.tar.gz
+sha256 67388ba23ab0c7033557a32084804f796aa2a796db7bb2b770fb76ac2a742eec  minidlna-1.2.1.tar.gz
diff --git a/package/minidlna/minidlna.mk b/package/minidlna/minidlna.mk
index d0d9136b4..e6f905927 100644
--- a/package/minidlna/minidlna.mk
+++ b/package/minidlna/minidlna.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-MINIDLNA_VERSION = 1.2.0
-MINIDLNA_SITE = http://downloads.sourceforge.net/project/minidlna/minidlna/$(MINIDLNA_VERSION)
+MINIDLNA_VERSION = 1.2.1
+MINIDLNA_SITE = https://downloads.sourceforge.net/project/minidlna/minidlna/$(MINIDLNA_VERSION)
 MINIDLNA_LICENSE = GPL-2.0, BSD-3-Clause
 MINIDLNA_LICENSE_FILES = COPYING LICENCE.miniupnpd
 
-- 
2.11.0
