From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 29 Apr 2018 21:09:06 +0200
Subject: [Buildroot] [PATCH 4/4] pcmanfm: bump to version 1.3.0
In-Reply-To: <20180429190906.25476-1-fontaine.fabrice@gmail.com>
References: <20180429190906.25476-1-fontaine.fabrice@gmail.com>
Message-ID: <20180429190906.25476-4-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/pcmanfm/pcmanfm.hash | 7 +++++--
 package/pcmanfm/pcmanfm.mk   | 2 +-
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/pcmanfm/pcmanfm.hash b/package/pcmanfm/pcmanfm.hash
index 155e9beb82..f633b49aac 100644
--- a/package/pcmanfm/pcmanfm.hash
+++ b/package/pcmanfm/pcmanfm.hash
@@ -1,3 +1,6 @@
 # From https://sourceforge.net/projects/pcmanfm/files/PCManFM%20%2B%20Libfm%20%28tarball%20release%29/PCManFM/
-md5 b4d1f8ce08d87e4f27805a246fc51ac2  pcmanfm-1.2.5.tar.xz
-sha1 9a8a2b4abebdf859e5ba2486eff84d505ad17b89  pcmanfm-1.2.5.tar.xz
+md5 827838f7f6b17dc97e1690c07da8fdb3  pcmanfm-1.3.0.tar.xz
+sha1 690fb28c0957ad56e28d1b8f5384e63462c118b2  pcmanfm-1.3.0.tar.xz
+
+# Hash for license file:
+sha256 231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
diff --git a/package/pcmanfm/pcmanfm.mk b/package/pcmanfm/pcmanfm.mk
index 31acae65bc..6dadfaeebd 100644
--- a/package/pcmanfm/pcmanfm.mk
+++ b/package/pcmanfm/pcmanfm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PCMANFM_VERSION = 1.2.5
+PCMANFM_VERSION = 1.3.0
 PCMANFM_SOURCE = pcmanfm-$(PCMANFM_VERSION).tar.xz
 PCMANFM_SITE = http://sourceforge.net/projects/pcmanfm/files
 PCMANFM_DEPENDENCIES = libglib2 menu-cache libfm
-- 
2.14.1
