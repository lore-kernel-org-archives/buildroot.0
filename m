From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 5 Jun 2017 11:05:25 +0100
Subject: [Buildroot] [PATCH] vdr: bump version to 2.3.6
Message-ID: <20170605100525.44776-1-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/vdr/vdr.hash | 6 +++---
 package/vdr/vdr.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/vdr/vdr.hash b/package/vdr/vdr.hash
index 2ced98d96..e7fad8dde 100644
--- a/package/vdr/vdr.hash
+++ b/package/vdr/vdr.hash
@@ -1,4 +1,4 @@
-# From https://www.linuxtv.org/pipermail/vdr/2017-May/029263.html
-md5 01fabef4d20ec01f11d53354d99a9642  vdr-2.3.5.tar.bz2
+# From https://www.linuxtv.org/pipermail/vdr/2017-June/029265.html
+md5 eab982df03da492a7d263718a8c487c2  vdr-2.3.6.tar.bz2
 # Locally computed
-sha256 323fd01e4f8daef24bbdcb906023d18c998a204a22de110d1cb0089532e818b5  vdr-2.3.5.tar.bz2
+sha256 f8604cb61f05d4bb658adb585166adfca198ca8650e9497115854413591e0b37  vdr-2.3.6.tar.bz2
diff --git a/package/vdr/vdr.mk b/package/vdr/vdr.mk
index 6c4656624..806ef4395 100644
--- a/package/vdr/vdr.mk
+++ b/package/vdr/vdr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VDR_VERSION = 2.3.5
+VDR_VERSION = 2.3.6
 VDR_SOURCE = vdr-$(VDR_VERSION).tar.bz2
 VDR_SITE = ftp://ftp.tvdr.de/vdr/Developer
 VDR_LICENSE = GPL-2.0+
-- 
2.13.0
