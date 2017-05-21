From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 21 May 2017 20:14:09 +0200
Subject: [Buildroot] [PATCH/next] package/botan: bump version to 1.10.16
Message-ID: <20170521181409.30601-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/botan/botan.hash | 2 +-
 package/botan/botan.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/botan/botan.hash b/package/botan/botan.hash
index 3da5f690c..3d46a1358 100644
--- a/package/botan/botan.hash
+++ b/package/botan/botan.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	23ec973d4b4a4fe04f490d409e08ac5638afe3aa09acd7f520daaff38ba19b90  Botan-1.10.13.tgz
+sha256 6c5472401d06527e87adcb53dd270f3c9b1fb688703b04dd7a7cfb86289efe52  Botan-1.10.16.tgz
diff --git a/package/botan/botan.mk b/package/botan/botan.mk
index 7694b8dbc..2f2415170 100644
--- a/package/botan/botan.mk
+++ b/package/botan/botan.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BOTAN_VERSION = 1.10.13
+BOTAN_VERSION = 1.10.16
 BOTAN_SOURCE = Botan-$(BOTAN_VERSION).tgz
 BOTAN_SITE = http://botan.randombit.net/releases
 BOTAN_LICENSE = BSD-2-Clause
-- 
2.11.0
