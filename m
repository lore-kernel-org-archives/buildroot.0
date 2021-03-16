From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 16 Mar 2021 21:40:04 +0100
Subject: [Buildroot] [git commit] package/pcmanfm: bump to version 1.3.2
Message-ID: <20210316201634.0C0477FF06@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4abeac474ccdee3f749219f1672e4ec5223e1ec1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update indentation in hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pcmanfm/pcmanfm.hash | 9 +++++----
 package/pcmanfm/pcmanfm.mk   | 2 +-
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/pcmanfm/pcmanfm.hash b/package/pcmanfm/pcmanfm.hash
index b5574e39cd..1911de20b1 100644
--- a/package/pcmanfm/pcmanfm.hash
+++ b/package/pcmanfm/pcmanfm.hash
@@ -1,6 +1,7 @@
 # From https://sourceforge.net/projects/pcmanfm/files/PCManFM%20%2B%20Libfm%20%28tarball%20release%29/PCManFM/
-md5  d32ad2c9c7c52bff2004bbc120b53420 pcmanfm-1.3.1.tar.xz
-sha1  4de1e5cb00fbf837c137f205e7e2327e3b49cb90 pcmanfm-1.3.1.tar.xz
+md5  ef7c4417d2697ef138d175db7aeae15a  pcmanfm-1.3.2.tar.xz
+sha1  bc4e468b0ec3089aaf817eafed43ae06350961ee  pcmanfm-1.3.2.tar.xz
 
-# Hash for license file:
-sha256 231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
+# Locally computed:
+sha256  14cb7b247493c4cce65fbb5902611e3ad00a7a870fbc1e50adc50428c5140cf7  pcmanfm-1.3.2.tar.xz
+sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
diff --git a/package/pcmanfm/pcmanfm.mk b/package/pcmanfm/pcmanfm.mk
index aecc438e5f..1379b19f5d 100644
--- a/package/pcmanfm/pcmanfm.mk
+++ b/package/pcmanfm/pcmanfm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PCMANFM_VERSION = 1.3.1
+PCMANFM_VERSION = 1.3.2
 PCMANFM_SOURCE = pcmanfm-$(PCMANFM_VERSION).tar.xz
 PCMANFM_SITE = http://sourceforge.net/projects/pcmanfm/files
 PCMANFM_DEPENDENCIES = libglib2 menu-cache libfm $(TARGET_NLS_DEPENDENCIES)
