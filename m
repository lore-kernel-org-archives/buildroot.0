From: Baruch Siach <baruch@tkos.co.il>
Date: Tue,  3 Nov 2020 18:41:29 +0200
Subject: [Buildroot] [PATCH] package/dropbear: bump to version 2020.81
Message-ID: <5a6a7c11064666cf8685bba9c2de9f985d84362e.1604421689.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/dropbear/dropbear.hash | 2 +-
 package/dropbear/dropbear.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dropbear/dropbear.hash b/package/dropbear/dropbear.hash
index af69cec53b00..82ff454f0a56 100644
--- a/package/dropbear/dropbear.hash
+++ b/package/dropbear/dropbear.hash
@@ -1,5 +1,5 @@
 # From https://matt.ucc.asn.au/dropbear/releases/SHA256SUM.asc
-sha256  d927941b91f2da150b2033f1a88b6a47999bf0afb1493a73e9216cffdb5d7949  dropbear-2020.80.tar.bz2
+sha256  48235d10b37775dbda59341ac0c4b239b82ad6318c31568b985730c788aac53b  dropbear-2020.81.tar.bz2
 
 # License file, locally computed
 sha256  a99ce657d790b761c132ee7e0de18edb437ae6361e536d991c6a12f36e770445  LICENSE
diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
index 3eaa98d0a437..00992f06626f 100644
--- a/package/dropbear/dropbear.mk
+++ b/package/dropbear/dropbear.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DROPBEAR_VERSION = 2020.80
+DROPBEAR_VERSION = 2020.81
 DROPBEAR_SITE = https://matt.ucc.asn.au/dropbear/releases
 DROPBEAR_SOURCE = dropbear-$(DROPBEAR_VERSION).tar.bz2
 DROPBEAR_LICENSE = MIT, BSD-2-Clause, Public domain
-- 
2.28.0
