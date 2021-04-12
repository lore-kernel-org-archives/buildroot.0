From: Francois Perrad <fperrad@gmail.com>
Date: Mon, 12 Apr 2021 18:59:08 +0200
Subject: [Buildroot] [PATCH] package/can-utils: bump to version 2020.12.0
Message-ID: <20210412165908.16427-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/can-utils/can-utils.hash | 2 +-
 package/can-utils/can-utils.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/can-utils/can-utils.hash b/package/can-utils/can-utils.hash
index d7d462450..e3ff2c9dd 100644
--- a/package/can-utils/can-utils.hash
+++ b/package/can-utils/can-utils.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  b8e53081c076fca248c39ae9ae5791359a81f1eb3e5fe23ff6fb0d0e1f1033fa  can-utils-2020.11.0.tar.gz
+sha256  c5c22a00ce2ea7578d7617ac0affef8f47a349be58e708780d703b979f324a2b  can-utils-2020.12.0.tar.gz
 sha256  c3dc748f5e725cf5ed89784fe78e4ff1b05d309bf1e7ade4c572e8fde1b8406c  LICENSES/BSD-3-Clause
 sha256  995a31f60a9ddb4c609214cc7d17ca94cc3cbc7f37e1e64dba81e7f8ea9d4f91  LICENSES/GPL-2.0-only.txt
diff --git a/package/can-utils/can-utils.mk b/package/can-utils/can-utils.mk
index 2cd7777d8..8beb672ec 100644
--- a/package/can-utils/can-utils.mk
+++ b/package/can-utils/can-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CAN_UTILS_VERSION = 2020.11.0
+CAN_UTILS_VERSION = 2020.12.0
 CAN_UTILS_SITE = $(call github,linux-can,can-utils,v$(CAN_UTILS_VERSION))
 CAN_UTILS_LICENSE = BSD-3-Clause or GPL-2.0
 CAN_UTILS_LICENSE_FILES = LICENSES/BSD-3-Clause LICENSES/GPL-2.0-only.txt
-- 
2.27.0
