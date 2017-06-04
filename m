From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  4 Jun 2017 15:03:43 +0200
Subject: [Buildroot] [PATCH 1/1] package/gptfdisk: bump version to 1.0.1
Message-ID: <20170604130343.29696-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Added sha256 hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/gptfdisk/gptfdisk.hash | 8 +++++---
 package/gptfdisk/gptfdisk.mk   | 2 +-
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/gptfdisk/gptfdisk.hash b/package/gptfdisk/gptfdisk.hash
index 0a72e0d92..c3a38af5f 100644
--- a/package/gptfdisk/gptfdisk.hash
+++ b/package/gptfdisk/gptfdisk.hash
@@ -1,3 +1,5 @@
-# From http://sourceforge.net/projects/gptfdisk/files/gptfdisk/1.0.0/
-md5	2061f917af084215898d4fea04d8388f	gptfdisk-1.0.0.tar.gz
-sha1	97f25db2def1c1939ed3954520bfd9948806d95a	gptfdisk-1.0.0.tar.gz
+# From http://sourceforge.net/projects/gptfdisk/files/gptfdisk/1.0.1/
+md5 d7f3d306b083123bcc6f5941efade586  gptfdisk-1.0.1.tar.gz
+sha1 ad28c511c642235815b83fffddf728c117057cba  gptfdisk-1.0.1.tar.gz
+# Locally computed
+sha256 864c8aee2efdda50346804d7e6230407d5f42a8ae754df70404dd8b2fdfaeac7  gptfdisk-1.0.1.tar.gz
diff --git a/package/gptfdisk/gptfdisk.mk b/package/gptfdisk/gptfdisk.mk
index 56be76543..9c9442145 100644
--- a/package/gptfdisk/gptfdisk.mk
+++ b/package/gptfdisk/gptfdisk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GPTFDISK_VERSION = 1.0.0
+GPTFDISK_VERSION = 1.0.1
 GPTFDISK_SITE = http://downloads.sourceforge.net/sourceforge/gptfdisk
 GPTFDISK_LICENSE = GPL-2.0+
 GPTFDISK_LICENSE_FILES = COPYING
-- 
2.11.0
