From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 16 Dec 2018 12:07:05 +0100
Subject: [Buildroot] [git commit] lsqlite3: bump to version 0.9.5
Message-ID: <20181216110337.A89D28D5D7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=869a91b534e0879a2d28fd496faaade60d8bc291
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/lsqlite3/lsqlite3.hash | 2 +-
 package/lsqlite3/lsqlite3.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/lsqlite3/lsqlite3.hash b/package/lsqlite3/lsqlite3.hash
index 7cf0358d11..0f11dcb366 100644
--- a/package/lsqlite3/lsqlite3.hash
+++ b/package/lsqlite3/lsqlite3.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	e6eb64a7ca3727c3093f3c37341d8ecadf9eac913e468eae413828476b19c225  lsqlite3-0.9.4-2.src.rock
+sha256 fdae3c03390ab4e4b7db3a13d09b79ffe19318739b752d17914adcdb3d2ef9ff  lsqlite3-0.9.5-1.src.rock
diff --git a/package/lsqlite3/lsqlite3.mk b/package/lsqlite3/lsqlite3.mk
index 6f6445d934..f5b91815fc 100644
--- a/package/lsqlite3/lsqlite3.mk
+++ b/package/lsqlite3/lsqlite3.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LSQLITE3_VERSION = 0.9.4-2
-LSQLITE3_SUBDIR = lsqlite3_fsl09x
+LSQLITE3_VERSION = 0.9.5-1
+LSQLITE3_SUBDIR = lsqlite3_fsl09y
 LSQLITE3_DEPENDENCIES = sqlite
 LSQLITE3_LICENSE = MIT
 
