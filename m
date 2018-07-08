From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  8 Jul 2018 21:44:48 +0200
Subject: [Buildroot] [PATCH 1/1] snappy: bump to version 1.1.7
Message-ID: <20180708194448.31093-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/snappy/snappy.hash | 3 ++-
 package/snappy/snappy.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/snappy/snappy.hash b/package/snappy/snappy.hash
index 71a2500f8f..e9ac4324c0 100644
--- a/package/snappy/snappy.hash
+++ b/package/snappy/snappy.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256 e701cd80f1154d648c762c86140ad6873a5c9b09ed1d754e3157be8193d2c39e  snappy-be6dc3db83c4701e3e79694dcbfd1c3da03b91dd.tar.gz
+sha256 3dfa02e873ff51a11ee02b9ca391807f0c8ea0529a4924afa645fbf97163f9d4  snappy-1.1.7.tar.gz
+sha256 55172044f7e241207117448a4d9d6ba1d0925c8ad66b5d4c08c70adfa9cc3de6  COPYING
diff --git a/package/snappy/snappy.mk b/package/snappy/snappy.mk
index a537ade57b..74d398de81 100644
--- a/package/snappy/snappy.mk
+++ b/package/snappy/snappy.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SNAPPY_VERSION = be6dc3db83c4701e3e79694dcbfd1c3da03b91dd
+SNAPPY_VERSION = 1.1.7
 SNAPPY_SITE = $(call github,google,snappy,$(SNAPPY_VERSION))
 SNAPPY_LICENSE = BSD-3-Clause
 SNAPPY_LICENSE_FILES = COPYING
-- 
2.14.1
