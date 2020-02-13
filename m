From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 13 Feb 2020 00:04:58 -0700
Subject: [Buildroot] [PATCH 1/1] package/snappy: bump to version 1.1.8
Message-ID: <20200213070458.61287-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/snappy/snappy.hash | 2 +-
 package/snappy/snappy.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/snappy/snappy.hash b/package/snappy/snappy.hash
index e9ac4324c0..c08c5b7fe4 100644
--- a/package/snappy/snappy.hash
+++ b/package/snappy/snappy.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 3dfa02e873ff51a11ee02b9ca391807f0c8ea0529a4924afa645fbf97163f9d4  snappy-1.1.7.tar.gz
+sha256 16b677f07832a612b0836178db7f374e414f94657c138e6993cbfc5dcc58651f  snappy-1.1.8.tar.gz
 sha256 55172044f7e241207117448a4d9d6ba1d0925c8ad66b5d4c08c70adfa9cc3de6  COPYING
diff --git a/package/snappy/snappy.mk b/package/snappy/snappy.mk
index 74d398de81..b764a0e4d0 100644
--- a/package/snappy/snappy.mk
+++ b/package/snappy/snappy.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SNAPPY_VERSION = 1.1.7
+SNAPPY_VERSION = 1.1.8
 SNAPPY_SITE = $(call github,google,snappy,$(SNAPPY_VERSION))
 SNAPPY_LICENSE = BSD-3-Clause
 SNAPPY_LICENSE_FILES = COPYING
-- 
2.20.1
