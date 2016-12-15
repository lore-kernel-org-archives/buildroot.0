From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 15 Dec 2016 13:49:04 +0200
Subject: [Buildroot] [PATCH] tcpreplay: bump to version 4.1.2
Message-ID: <e8eea2021e52cfa1944bf657acaea55b88d4ba6b.1481802544.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/tcpreplay/tcpreplay.hash | 2 +-
 package/tcpreplay/tcpreplay.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tcpreplay/tcpreplay.hash b/package/tcpreplay/tcpreplay.hash
index 95d6d5d81876..e7ba4400ec8a 100644
--- a/package/tcpreplay/tcpreplay.hash
+++ b/package/tcpreplay/tcpreplay.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	61b916ef91049cad2a9ddc8de6f5e3e3cc5d9998dbb644dc91cf3a798497ffe4	tcpreplay-4.1.1.tar.gz
+sha256	da483347e83a9b5df0e0dbb0f822a2d37236e79dda35f4bc4e6684fa827f25ea	tcpreplay-4.1.2.tar.gz
diff --git a/package/tcpreplay/tcpreplay.mk b/package/tcpreplay/tcpreplay.mk
index 0723c02d2836..a8bcf1c5dd99 100644
--- a/package/tcpreplay/tcpreplay.mk
+++ b/package/tcpreplay/tcpreplay.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TCPREPLAY_VERSION = 4.1.1
+TCPREPLAY_VERSION = 4.1.2
 TCPREPLAY_SITE = https://github.com/appneta/tcpreplay/releases/download/v$(TCPREPLAY_VERSION)
 TCPREPLAY_LICENSE = GPLv3
 TCPREPLAY_LICENSE_FILES = docs/LICENSE
-- 
2.10.2
