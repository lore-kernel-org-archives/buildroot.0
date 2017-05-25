From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 26 May 2017 00:39:50 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/dmidecode: bump version to 3.1
Message-ID: <20170525223950.25714-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/dmidecode/dmidecode.hash | 4 ++--
 package/dmidecode/dmidecode.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/dmidecode/dmidecode.hash b/package/dmidecode/dmidecode.hash
index 307c306ad..1e8154b37 100644
--- a/package/dmidecode/dmidecode.hash
+++ b/package/dmidecode/dmidecode.hash
@@ -1,2 +1,2 @@
-# http://http.debian.net/debian/pool/main/d/dmidecode/dmidecode_3.0-2.dsc
-sha256	7ec35bb193729c1d593a1460b59d82d24b89102ab23fd0416e6cf4325d077e45	dmidecode-3.0.tar.xz
+# Locally computed
+sha256 d766ce9b25548c59b1e7e930505b4cad9a7bb0b904a1a391fbb604d529781ac0  dmidecode-3.1.tar.xz
diff --git a/package/dmidecode/dmidecode.mk b/package/dmidecode/dmidecode.mk
index b6c59db70..b6f96b6df 100644
--- a/package/dmidecode/dmidecode.mk
+++ b/package/dmidecode/dmidecode.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DMIDECODE_VERSION = 3.0
+DMIDECODE_VERSION = 3.1
 DMIDECODE_SOURCE = dmidecode-$(DMIDECODE_VERSION).tar.xz
 DMIDECODE_SITE = http://download.savannah.gnu.org/releases/dmidecode
 DMIDECODE_LICENSE = GPL-2.0+
-- 
2.11.0
