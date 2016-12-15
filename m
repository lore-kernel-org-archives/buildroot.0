From: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
Date: Thu, 15 Dec 2016 17:10:40 +0530
Subject: [Buildroot] [PATCH 1/2] tinyalsa: bump version to 1.1.0
Message-ID: <1481802041-2365-1-git-send-email-rahul.bedarkar@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
---
 package/tinyalsa/tinyalsa.hash | 2 +-
 package/tinyalsa/tinyalsa.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tinyalsa/tinyalsa.hash b/package/tinyalsa/tinyalsa.hash
index e07b419..b6bea47 100644
--- a/package/tinyalsa/tinyalsa.hash
+++ b/package/tinyalsa/tinyalsa.hash
@@ -1,2 +1,2 @@
 # locally computed
-sha256  b3f22f762cca8edc692d239a9793a66b11aa5447dcee009e53987f5850f405e3  tinyalsa-v1.0.2.tar.gz
+sha256  93f4ca1e6345974167dc5577e8151a31fa2e6a628727a72d59e18db2289e7a1c  tinyalsa-1.1.0.tar.gz
diff --git a/package/tinyalsa/tinyalsa.mk b/package/tinyalsa/tinyalsa.mk
index 87753d6..0edb0bc 100644
--- a/package/tinyalsa/tinyalsa.mk
+++ b/package/tinyalsa/tinyalsa.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TINYALSA_VERSION = v1.0.2
+TINYALSA_VERSION = 1.1.0
 TINYALSA_SITE = $(call github,tinyalsa,tinyalsa,$(TINYALSA_VERSION))
 TINYALSA_LICENSE = BSD-3c
 TINYALSA_INSTALL_STAGING = YES
-- 
2.6.2
