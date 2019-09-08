From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  8 Sep 2019 10:01:39 +0200
Subject: [Buildroot] [PATCH 1/1] package/aespipe: bump to version 2.4e
Message-ID: <20190908080139.5516-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/aespipe/aespipe.hash | 2 +-
 package/aespipe/aespipe.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/aespipe/aespipe.hash b/package/aespipe/aespipe.hash
index cc7640a0d0..7e3a16503c 100644
--- a/package/aespipe/aespipe.hash
+++ b/package/aespipe/aespipe.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256 c5ce656e0ade49b93e1163ec7b35450721d5743d8d804ad3a9e39add0389e50f  aespipe-v2.4d.tar.bz2
+sha256 bad5abb8678c2a6062d22b893171623e0c8e6163b5c1e6e5086e2140e606b93a  aespipe-v2.4e.tar.bz2
diff --git a/package/aespipe/aespipe.mk b/package/aespipe/aespipe.mk
index 5ef95d5206..aa25420f11 100644
--- a/package/aespipe/aespipe.mk
+++ b/package/aespipe/aespipe.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AESPIPE_VERSION = 2.4d
+AESPIPE_VERSION = 2.4e
 AESPIPE_SOURCE = aespipe-v$(AESPIPE_VERSION).tar.bz2
 AESPIPE_SITE = http://loop-aes.sourceforge.net/aespipe
 AESPIPE_LICENSE = GPL
-- 
2.23.0.rc1
