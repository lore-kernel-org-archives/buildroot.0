From: Gilles Talis <gilles.talis@gmail.com>
Date: Sun, 13 Dec 2020 18:15:29 +0100
Subject: [Buildroot] [PATCH] package/iozone: bump to version 3_490
Message-ID: <20201213171531.5182-1-gilles.talis@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also updated indentation in hash file (two spaces)

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
---
 package/iozone/iozone.hash | 2 +-
 package/iozone/iozone.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/iozone/iozone.hash b/package/iozone/iozone.hash
index f2f40473c3..61e8ff3abe 100644
--- a/package/iozone/iozone.hash
+++ b/package/iozone/iozone.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	6155850d1019f2450dc926bbdb5a24abf423ee3bb928ab1e68569cf60a908584	iozone3_489.tar
+sha256  5eadb4235ae2a956911204c50ebf2d8d8d59ddcd4a2841a1baf42f3145ad4fed  iozone3_490.tar
diff --git a/package/iozone/iozone.mk b/package/iozone/iozone.mk
index a491faf9d4..ebb6243651 100644
--- a/package/iozone/iozone.mk
+++ b/package/iozone/iozone.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IOZONE_VERSION = 3_489
+IOZONE_VERSION = 3_490
 IOZONE_SOURCE = iozone$(IOZONE_VERSION).tar
 IOZONE_SITE = http://www.iozone.org/src/current
 IOZONE_LICENSE = IOzone license (NO DERIVED WORKS ALLOWED)
-- 
2.25.1
