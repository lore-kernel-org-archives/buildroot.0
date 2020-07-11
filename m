From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 11 Jul 2020 15:25:35 +0200
Subject: [Buildroot] [git commit] package/babeld: bump version to 1.9.2
Message-ID: <20200711132210.EE561843E5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=aff4e474b311826eafb0268d7c856d676b432e7d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also separate the fields in the hash file by two spaces.

Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/babeld/babeld.hash | 4 ++--
 package/babeld/babeld.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/babeld/babeld.hash b/package/babeld/babeld.hash
index 510fe2bc95..2e0513efa0 100644
--- a/package/babeld/babeld.hash
+++ b/package/babeld/babeld.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 98070dc418c190f047b8d69eb47987df30ded8f0fca353c49427d3137ad08b87  babeld-1.8.4.tar.gz
-sha256 b415c41292cedef6c97b243609e50552887c29343566c639f23282d31efd2afd  LICENCE
+sha256  154f00e0a8bf35d6ea9028886c3dc5c3c342dd1a367df55ef29a547b75867f07  babeld-1.9.2.tar.gz
+sha256  b415c41292cedef6c97b243609e50552887c29343566c639f23282d31efd2afd  LICENCE
diff --git a/package/babeld/babeld.mk b/package/babeld/babeld.mk
index f864b5db26..785fa2bce9 100644
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
