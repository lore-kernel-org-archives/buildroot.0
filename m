From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 16 Feb 2020 17:17:18 +0100
Subject: [Buildroot] [git commit] package/minicom: bump version
Message-ID: <20200216160603.9535C8E263@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ce084ccb761e5744006d067fcd664607f97371af
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For a minor fix.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/minicom/minicom.hash | 2 +-
 package/minicom/minicom.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/minicom/minicom.hash b/package/minicom/minicom.hash
index 9725f58f6d..7622ec004c 100644
--- a/package/minicom/minicom.hash
+++ b/package/minicom/minicom.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 c8e34cc583f3b09c65871f5080b04799895b1ebd72092c0e18cb20a631f6c4b1  minicom-a6a507dcb8bd4cb5da7af9e2dc75b8e495fedbb6.tar.gz
+sha256 f2b69b874b93f7bb68ad84e09d4d4c7a79160fcdd0117e8c0c1465fe71e64f28  minicom-52b626b15a883b0300682a03aa8e048e317f1e56.tar.gz
 sha256 cf80a758014eefbf068afffe3d462fc34ff4f528527524d8e100329c42094e15  COPYING
diff --git a/package/minicom/minicom.mk b/package/minicom/minicom.mk
index d299dac43d..77bc6f533d 100644
--- a/package/minicom/minicom.mk
+++ b/package/minicom/minicom.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MINICOM_VERSION = a6a507dcb8bd4cb5da7af9e2dc75b8e495fedbb6
+MINICOM_VERSION = 52b626b15a883b0300682a03aa8e048e317f1e56
 MINICOM_SITE = https://salsa.debian.org/minicom-team/minicom.git
 MINICOM_SITE_METHOD = git
 MINICOM_LICENSE = GPL-2.0+
