From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon,  2 Apr 2018 19:07:53 +0200
Subject: [Buildroot] [PATCH 1/1] tinycbor: bump to version 0.5.1
Message-ID: <20180402170753.30930-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/tinycbor/tinycbor.hash | 2 +-
 package/tinycbor/tinycbor.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tinycbor/tinycbor.hash b/package/tinycbor/tinycbor.hash
index 73ab82f528..db9c595733 100644
--- a/package/tinycbor/tinycbor.hash
+++ b/package/tinycbor/tinycbor.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256	5826a284e7f120a8d2c49cb581702be3e851acb4083a4f5af6112975a8b22209	tinycbor-v0.5.0.tar.gz
+sha256	f9d2ec366a38382c1b7bb989c45620dca168ad28107b4ef9a306ee93c3dbb832	tinycbor-v0.5.1.tar.gz
 sha256	3c6ba0b5bfa7830505301ffb336a17b0748e0d61c4d34216e9dc98f10e40395e	LICENSE
diff --git a/package/tinycbor/tinycbor.mk b/package/tinycbor/tinycbor.mk
index a9afbb6e46..2aec68be77 100644
--- a/package/tinycbor/tinycbor.mk
+++ b/package/tinycbor/tinycbor.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TINYCBOR_VERSION = v0.5.0
+TINYCBOR_VERSION = v0.5.1
 TINYCBOR_SITE = $(call github,intel,tinycbor,$(TINYCBOR_VERSION))
 TINYCBOR_LICENSE = MIT
 TINYCBOR_LICENSE_FILES = LICENSE
-- 
2.14.1
