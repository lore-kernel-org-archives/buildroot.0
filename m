From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Wed,  2 Dec 2020 18:25:58 +0100
Subject: [Buildroot] [PATCH] package/minicom: bump version
Message-ID: <20201202172558.169751-1-giulio.benetti@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Minor fixes.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/minicom/minicom.hash | 4 ++--
 package/minicom/minicom.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/minicom/minicom.hash b/package/minicom/minicom.hash
index dafc9da4f4..0b8b1d0745 100644
--- a/package/minicom/minicom.hash
+++ b/package/minicom/minicom.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 66af38ae98cdf965b9a591013df4256773f18338613ec22bbb83440968289a8a  minicom-23292150e07ec264827fb6cf237ddb0ac9fc043b.tar.gz
-sha256 cf80a758014eefbf068afffe3d462fc34ff4f528527524d8e100329c42094e15  COPYING
+sha256  c0a72a099bea13abdf5a315f56a87a75a92000b71e36193188487cdad063b540  minicom-79ef3185df5ae9cdc8307f9b9ba17463743f22f0.tar.gz
+sha256  cf80a758014eefbf068afffe3d462fc34ff4f528527524d8e100329c42094e15  COPYING
diff --git a/package/minicom/minicom.mk b/package/minicom/minicom.mk
index bdbeb53775..7aaf18880e 100644
--- a/package/minicom/minicom.mk
+++ b/package/minicom/minicom.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MINICOM_VERSION = 23292150e07ec264827fb6cf237ddb0ac9fc043b
+MINICOM_VERSION = 79ef3185df5ae9cdc8307f9b9ba17463743f22f0
 MINICOM_SITE = https://salsa.debian.org/minicom-team/minicom.git
 MINICOM_SITE_METHOD = git
 MINICOM_LICENSE = GPL-2.0+
-- 
2.25.1
