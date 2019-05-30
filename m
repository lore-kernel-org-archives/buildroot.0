From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 30 May 2019 23:51:12 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/iwd: bump to version 0.18
Message-ID: <20190530215112.26962-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix build with ell 0.20

Fixes:
 - http://autobuild.buildroot.org/results/2bd1fb482ee5d963fa335d1fddd90ee6cf96a0d6

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/iwd/iwd.hash | 2 +-
 package/iwd/iwd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/iwd/iwd.hash b/package/iwd/iwd.hash
index d8eefc064c..a24521ba79 100644
--- a/package/iwd/iwd.hash
+++ b/package/iwd/iwd.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256 e416bd549474b2940b0e43ac680795fbafe2b4965fe6a977cd4c1caa1a05e897 iwd-0.13.tar.gz
+sha256 28e67c9a55182d08407be34e85cb31de482ba7fd50571fa34d7a16e289bd2e7f iwd-0.18.tar.gz
 
 # License files
 sha256 ec60b993835e2c6b79e6d9226345f4e614e686eb57dc13b6420c15a33a8996e5 COPYING
diff --git a/package/iwd/iwd.mk b/package/iwd/iwd.mk
index 63736947cf..1e68c320d7 100644
--- a/package/iwd/iwd.mk
+++ b/package/iwd/iwd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IWD_VERSION = 0.13
+IWD_VERSION = 0.18
 IWD_SITE = https://git.kernel.org/pub/scm/network/wireless/iwd.git
 IWD_SITE_METHOD = git
 IWD_LICENSE = LGPL-2.1+
-- 
2.20.1
