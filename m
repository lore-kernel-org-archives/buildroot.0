From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Mon,  4 Jan 2021 23:38:21 +0100
Subject: [Buildroot] [PATCH] package/minicom: bump to version 2.8 commit
Message-ID: <20210104223821.72542-1-giulio.benetti@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/minicom/minicom.hash | 2 +-
 package/minicom/minicom.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/minicom/minicom.hash b/package/minicom/minicom.hash
index 0b8b1d0745..cabf84fa00 100644
--- a/package/minicom/minicom.hash
+++ b/package/minicom/minicom.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  c0a72a099bea13abdf5a315f56a87a75a92000b71e36193188487cdad063b540  minicom-79ef3185df5ae9cdc8307f9b9ba17463743f22f0.tar.gz
+sha256  bbea83d65da4145f789fbfe0bfb1ecf859bd7b6fc6d35ea4e03d21d5f2c7b80a  minicom-42102971cc309599e4576371e8db66c507c21424.tar.gz
 sha256  cf80a758014eefbf068afffe3d462fc34ff4f528527524d8e100329c42094e15  COPYING
diff --git a/package/minicom/minicom.mk b/package/minicom/minicom.mk
index 7aaf18880e..e94f70d299 100644
--- a/package/minicom/minicom.mk
+++ b/package/minicom/minicom.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MINICOM_VERSION = 79ef3185df5ae9cdc8307f9b9ba17463743f22f0
+MINICOM_VERSION = 42102971cc309599e4576371e8db66c507c21424
 MINICOM_SITE = https://salsa.debian.org/minicom-team/minicom.git
 MINICOM_SITE_METHOD = git
 MINICOM_LICENSE = GPL-2.0+
-- 
2.25.1
