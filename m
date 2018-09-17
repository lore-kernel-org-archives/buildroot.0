From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 17 Sep 2018 22:51:55 +0200
Subject: [Buildroot] [PATCH 1/1] tinycbor: bump to version 0.5.2
Message-ID: <20180917205155.17965-1-fontaine.fabrice@gmail.com>
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
index db9c595733..6a7282dcba 100644
--- a/package/tinycbor/tinycbor.hash
+++ b/package/tinycbor/tinycbor.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256	f9d2ec366a38382c1b7bb989c45620dca168ad28107b4ef9a306ee93c3dbb832	tinycbor-v0.5.1.tar.gz
+sha256	dfa2a4550eb145a5f62ffff39e36accf2704987922c194e8e845124175c00441	tinycbor-v0.5.2.tar.gz
 sha256	3c6ba0b5bfa7830505301ffb336a17b0748e0d61c4d34216e9dc98f10e40395e	LICENSE
diff --git a/package/tinycbor/tinycbor.mk b/package/tinycbor/tinycbor.mk
index 2aec68be77..40a828d545 100644
--- a/package/tinycbor/tinycbor.mk
+++ b/package/tinycbor/tinycbor.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TINYCBOR_VERSION = v0.5.1
+TINYCBOR_VERSION = v0.5.2
 TINYCBOR_SITE = $(call github,intel,tinycbor,$(TINYCBOR_VERSION))
 TINYCBOR_LICENSE = MIT
 TINYCBOR_LICENSE_FILES = LICENSE
-- 
2.17.1
