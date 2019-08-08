From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu,  8 Aug 2019 10:03:25 +0200
Subject: [Buildroot] [PATCH 4/4] package/pcmanfm: bump to version 1.3.1
In-Reply-To: <20190808080325.4182-1-fontaine.fabrice@gmail.com>
References: <20190808080325.4182-1-fontaine.fabrice@gmail.com>
Message-ID: <20190808080325.4182-4-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/pcmanfm/pcmanfm.hash | 4 ++--
 package/pcmanfm/pcmanfm.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/pcmanfm/pcmanfm.hash b/package/pcmanfm/pcmanfm.hash
index f633b49aac..b5574e39cd 100644
--- a/package/pcmanfm/pcmanfm.hash
+++ b/package/pcmanfm/pcmanfm.hash
@@ -1,6 +1,6 @@
 # From https://sourceforge.net/projects/pcmanfm/files/PCManFM%20%2B%20Libfm%20%28tarball%20release%29/PCManFM/
-md5 827838f7f6b17dc97e1690c07da8fdb3  pcmanfm-1.3.0.tar.xz
-sha1 690fb28c0957ad56e28d1b8f5384e63462c118b2  pcmanfm-1.3.0.tar.xz
+md5  d32ad2c9c7c52bff2004bbc120b53420 pcmanfm-1.3.1.tar.xz
+sha1  4de1e5cb00fbf837c137f205e7e2327e3b49cb90 pcmanfm-1.3.1.tar.xz
 
 # Hash for license file:
 sha256 231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
diff --git a/package/pcmanfm/pcmanfm.mk b/package/pcmanfm/pcmanfm.mk
index 5d8730984c..1d946ba521 100644
--- a/package/pcmanfm/pcmanfm.mk
+++ b/package/pcmanfm/pcmanfm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PCMANFM_VERSION = 1.3.0
+PCMANFM_VERSION = 1.3.1
 PCMANFM_SOURCE = pcmanfm-$(PCMANFM_VERSION).tar.xz
 PCMANFM_SITE = http://sourceforge.net/projects/pcmanfm/files
 PCMANFM_DEPENDENCIES = libglib2 menu-cache libfm $(TARGET_NLS_DEPENDENCIES)
-- 
2.20.1
