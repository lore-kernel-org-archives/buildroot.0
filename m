From: Sergio Prado <sergio.prado@e-labworks.com>
Date: Thu,  9 Jul 2020 20:37:40 -0300
Subject: [Buildroot] [PATCH] package/babeld: bump version to 1.9.2
Message-ID: <20200709233740.27036-1-sergio.prado@e-labworks.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also separate the fields in the hash file by two spaces.

Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
---
 package/babeld/babeld.hash | 4 ++--
 package/babeld/babeld.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/babeld/babeld.hash b/package/babeld/babeld.hash
index 510fe2bc95eb..2e0513efa010 100644
--- a/package/babeld/babeld.hash
+++ b/package/babeld/babeld.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 98070dc418c190f047b8d69eb47987df30ded8f0fca353c49427d3137ad08b87  babeld-1.8.4.tar.gz
-sha256 b415c41292cedef6c97b243609e50552887c29343566c639f23282d31efd2afd  LICENCE
+sha256  154f00e0a8bf35d6ea9028886c3dc5c3c342dd1a367df55ef29a547b75867f07  babeld-1.9.2.tar.gz
+sha256  b415c41292cedef6c97b243609e50552887c29343566c639f23282d31efd2afd  LICENCE
diff --git a/package/babeld/babeld.mk b/package/babeld/babeld.mk
index f864b5db26d9..785fa2bce9f1 100644
--- a/package/babeld/babeld.mk
+++ b/package/babeld/babeld.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BABELD_VERSION = 1.8.4
+BABELD_VERSION = 1.9.2
 BABELD_SITE = http://www.pps.univ-paris-diderot.fr/~jch/software/files
 BABELD_LICENSE = MIT
 BABELD_LICENSE_FILES = LICENCE
-- 
2.17.1
