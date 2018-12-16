From: Francois Perrad <fperrad@gmail.com>
Date: Sun, 16 Dec 2018 09:56:48 +0100
Subject: [Buildroot] [PATCH 04/12] lsqlite3: bump to version 0.9.5
In-Reply-To: <20181216085656.30105-1-francois.perrad@gadz.org>
References: <20181216085656.30105-1-francois.perrad@gadz.org>
Message-ID: <20181216085656.30105-4-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/lsqlite3/lsqlite3.hash | 2 +-
 package/lsqlite3/lsqlite3.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/lsqlite3/lsqlite3.hash b/package/lsqlite3/lsqlite3.hash
index 7cf0358d1..0f11dcb36 100644
--- a/package/lsqlite3/lsqlite3.hash
+++ b/package/lsqlite3/lsqlite3.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	e6eb64a7ca3727c3093f3c37341d8ecadf9eac913e468eae413828476b19c225  lsqlite3-0.9.4-2.src.rock
+sha256 fdae3c03390ab4e4b7db3a13d09b79ffe19318739b752d17914adcdb3d2ef9ff  lsqlite3-0.9.5-1.src.rock
diff --git a/package/lsqlite3/lsqlite3.mk b/package/lsqlite3/lsqlite3.mk
index 6f6445d93..f5b91815f 100644
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
 
-- 
2.17.1
