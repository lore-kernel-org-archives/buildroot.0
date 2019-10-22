From: Nicolas Serafini <nicolas.serafini@sensefly.com>
Date: Tue, 22 Oct 2019 13:49:42 +0000
Subject: [Buildroot] [PATCH] package/iwd: bump version to 0.22
Message-ID: <20191022134919.35158-1-nicolas.serafini@sensefly.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Nicolas Serafini <nicolas.serafini@sensefly.com>
---
 package/iwd/iwd.hash | 2 +-
 package/iwd/iwd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/iwd/iwd.hash b/package/iwd/iwd.hash
index a24521ba79..e7ba107a3b 100644
--- a/package/iwd/iwd.hash
+++ b/package/iwd/iwd.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256 28e67c9a55182d08407be34e85cb31de482ba7fd50571fa34d7a16e289bd2e7f iwd-0.18.tar.gz
+sha256 f52ed3cc0dae1f9a82c601df638977f0f6d8d4629ba5e333b4743748a907c0e7 iwd-0.22.tar.gz
 
 # License files
 sha256 ec60b993835e2c6b79e6d9226345f4e614e686eb57dc13b6420c15a33a8996e5 COPYING
diff --git a/package/iwd/iwd.mk b/package/iwd/iwd.mk
index 1e68c320d7..b172d94fc6 100644
--- a/package/iwd/iwd.mk
+++ b/package/iwd/iwd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IWD_VERSION = 0.18
+IWD_VERSION = 0.22
 IWD_SITE = https://git.kernel.org/pub/scm/network/wireless/iwd.git
 IWD_SITE_METHOD = git
 IWD_LICENSE = LGPL-2.1+
-- 
2.23.0
