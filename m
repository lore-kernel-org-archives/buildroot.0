From: Sergio Prado <sergio.prado@e-labworks.com>
Date: Tue,  7 Jul 2020 20:35:23 -0300
Subject: [Buildroot] [PATCH] package/cutelyst: bump version to 2.11.0
Message-ID: <20200707233523.16435-1-sergio.prado@e-labworks.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also separate the fields in the hash file by two spaces.

Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
---
 package/cutelyst/cutelyst.hash | 4 ++--
 package/cutelyst/cutelyst.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/cutelyst/cutelyst.hash b/package/cutelyst/cutelyst.hash
index e9c116196976..d35fdcc890c4 100644
--- a/package/cutelyst/cutelyst.hash
+++ b/package/cutelyst/cutelyst.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking pgp signature
-sha256  5036378d0d8242da68f61bc2f51fc37b881b720311073b6f6cfb113cbae18a40    cutelyst-2.9.0.tar.gz
-sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551    COPYING
+sha256  b0e3d658a60d68906f7255b78bad64af1aa07cb3b785fbf61629b7355f089baa  cutelyst-2.11.0.tar.gz
+sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/cutelyst/cutelyst.mk b/package/cutelyst/cutelyst.mk
index f2129312d5c2..952092245467 100644
--- a/package/cutelyst/cutelyst.mk
+++ b/package/cutelyst/cutelyst.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CUTELYST_VERSION = 2.9.0
+CUTELYST_VERSION = 2.11.0
 CUTELYST_SITE = https://github.com/cutelyst/cutelyst/archive/v$(CUTELYST_VERSION)
 CUTELYST_INSTALL_STAGING = YES
 CUTELYST_SUPPORTS_IN_SOURCE_BUILD = NO
-- 
2.17.1
