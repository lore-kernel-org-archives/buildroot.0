From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 17 Dec 2016 08:16:58 +0100
Subject: [Buildroot] [PATCH 1/2] package/aespipe: bump version to 2.4d
Message-ID: <20161217071659.3975-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/aespipe/aespipe.hash | 2 +-
 package/aespipe/aespipe.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/aespipe/aespipe.hash b/package/aespipe/aespipe.hash
index fa66b97..cc7640a 100644
--- a/package/aespipe/aespipe.hash
+++ b/package/aespipe/aespipe.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256  260190beea911190a839e711f610ec3454a9b13985d35479775b7e26ad4c845e  aespipe-v2.4c.tar.bz2
+sha256 c5ce656e0ade49b93e1163ec7b35450721d5743d8d804ad3a9e39add0389e50f  aespipe-v2.4d.tar.bz2
diff --git a/package/aespipe/aespipe.mk b/package/aespipe/aespipe.mk
index c567092..6a38556 100644
--- a/package/aespipe/aespipe.mk
+++ b/package/aespipe/aespipe.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AESPIPE_VERSION = 2.4c
+AESPIPE_VERSION = 2.4d
 AESPIPE_SOURCE = aespipe-v$(AESPIPE_VERSION).tar.bz2
 AESPIPE_SITE = http://loop-aes.sourceforge.net/aespipe
 AESPIPE_LICENSE = GPL
-- 
2.10.2
