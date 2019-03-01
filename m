From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri,  1 Mar 2019 21:42:24 +0100
Subject: [Buildroot] [PATCH/next 1/1] package/dmidecode: bump to version 3.2
Message-ID: <20190301204224.29565-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/dmidecode/dmidecode.hash | 3 ++-
 package/dmidecode/dmidecode.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/dmidecode/dmidecode.hash b/package/dmidecode/dmidecode.hash
index 1e8154b37d..c6edf4bcac 100644
--- a/package/dmidecode/dmidecode.hash
+++ b/package/dmidecode/dmidecode.hash
@@ -1,2 +1,3 @@
 # Locally computed
-sha256 d766ce9b25548c59b1e7e930505b4cad9a7bb0b904a1a391fbb604d529781ac0  dmidecode-3.1.tar.xz
+sha256 077006fa2da0d06d6383728112f2edef9684e9c8da56752e97cd45a11f838edd  dmidecode-3.2.tar.xz
+sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/dmidecode/dmidecode.mk b/package/dmidecode/dmidecode.mk
index b6f96b6df8..811565d8e4 100644
--- a/package/dmidecode/dmidecode.mk
+++ b/package/dmidecode/dmidecode.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DMIDECODE_VERSION = 3.1
+DMIDECODE_VERSION = 3.2
 DMIDECODE_SOURCE = dmidecode-$(DMIDECODE_VERSION).tar.xz
 DMIDECODE_SITE = http://download.savannah.gnu.org/releases/dmidecode
 DMIDECODE_LICENSE = GPL-2.0+
-- 
2.14.1
