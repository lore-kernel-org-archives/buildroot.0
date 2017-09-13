From: Joel Stanley <joel@jms.id.au>
Date: Wed, 13 Sep 2017 14:48:44 +1000
Subject: [Buildroot] [PATCH] powerpc-utils: Bump version to 1.3.4
Message-ID: <20170913044844.24162-1-joel@jms.id.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This also moves the source tree to the new official upstream location at
ibm-power-utilities GitHub organisation.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 package/powerpc-utils/powerpc-utils.hash | 2 +-
 package/powerpc-utils/powerpc-utils.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/powerpc-utils/powerpc-utils.hash b/package/powerpc-utils/powerpc-utils.hash
index fe5cc6a24d90..437a5865c2bf 100644
--- a/package/powerpc-utils/powerpc-utils.hash
+++ b/package/powerpc-utils/powerpc-utils.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 2a3f4e7ef219d4de642c7da100d7d6511e93556778c0814b2ebc1170256fc844 powerpc-utils-v1.3.3.tar.gz
+sha256 d36372efebc1f6f9409501f7ab68a812843925334dee6438e7b52a53c21574c5 powerpc-utils-v1.3.4.tar.gz
diff --git a/package/powerpc-utils/powerpc-utils.mk b/package/powerpc-utils/powerpc-utils.mk
index 0aa79dc2a0ec..da7a3c9cd6e3 100644
--- a/package/powerpc-utils/powerpc-utils.mk
+++ b/package/powerpc-utils/powerpc-utils.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-POWERPC_UTILS_VERSION = v1.3.3
-POWERPC_UTILS_SITE = $(call github,nfont,powerpc-utils,$(POWERPC_UTILS_VERSION))
+POWERPC_UTILS_VERSION = v1.3.4
+POWERPC_UTILS_SITE = $(call github,ibm-power-utilities,powerpc-utils,$(POWERPC_UTILS_VERSION))
 POWERPC_UTILS_DEPENDENCIES = zlib
 POWERPC_UTILS_AUTORECONF = YES
 POWERPC_UTILS_LICENSE = GPL-2.0+
-- 
2.14.1
