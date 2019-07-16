From: aduskett at gmail.com <aduskett@gmail.com>
Date: Tue, 16 Jul 2019 11:12:56 -0400
Subject: [Buildroot] [PATCH 1/2] package/mender: bump to version 2.0.1
Message-ID: <20190716151257.78244-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/mender/mender.hash | 2 +-
 package/mender/mender.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mender/mender.hash b/package/mender/mender.hash
index 5981252b4d..ba69229fcb 100644
--- a/package/mender/mender.hash
+++ b/package/mender/mender.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256 af37a11c4189097b485254c35450f289b078bc61f6a230d6540743f202d81b98 2.0.0.tar.gz
+sha256 0ece9e7b23ab43691112aac90d3b757c37ebd1c7c2b3d9c0668243d1503d1e55 2.0.1.tar.gz
 
 # Apache-2.0 license, locally computed
 sha256 beb140be4cd64599bedc691a55b2729c9cc611a4b9d6ec44e01270105daf18a2 LICENSE
diff --git a/package/mender/mender.mk b/package/mender/mender.mk
index 12a25fbbf3..1179fdc688 100644
--- a/package/mender/mender.mk
+++ b/package/mender/mender.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MENDER_VERSION = 2.0.0
+MENDER_VERSION = 2.0.1
 MENDER_SITE = https://github.com/mendersoftware/mender/archive
 MENDER_SOURCE = $(MENDER_VERSION).tar.gz
 MENDER_LICENSE = Apache-2.0, BSD-2-Clause, BSD-3-Clause, ISC, MIT, OLDAP-2.8
-- 
2.21.0
