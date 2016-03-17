From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 17 Mar 2016 20:10:22 +0200
Subject: [Buildroot] [PATCH] quagga: bump to version 1.0.20160315
Message-ID: <997f497f3491b0fc740708ca85d0e84801d2a563.1458238222.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/quagga/quagga.hash | 2 +-
 package/quagga/quagga.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/quagga/quagga.hash b/package/quagga/quagga.hash
index fdc7472d7506..23a0a8245bda 100644
--- a/package/quagga/quagga.hash
+++ b/package/quagga/quagga.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	034e21f87164f44f1c4c89d8fafed4acede298fe3fafbf9277f079544178c66b	quagga-1.0.20160309.tar.xz
+sha256	d284af5dd875dbba90ab875d40db5d68fdc9ede17a76f2af525f85344be56767	quagga-1.0.20160315.tar.xz
diff --git a/package/quagga/quagga.mk b/package/quagga/quagga.mk
index 5f0d201fa9ef..6b98367bcb84 100644
--- a/package/quagga/quagga.mk
+++ b/package/quagga/quagga.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QUAGGA_VERSION = 1.0.20160309
+QUAGGA_VERSION = 1.0.20160315
 QUAGGA_SOURCE = quagga-$(QUAGGA_VERSION).tar.xz
 QUAGGA_SITE = http://download.savannah.gnu.org/releases/quagga
 QUAGGA_DEPENDENCIES = host-gawk
-- 
2.7.0
