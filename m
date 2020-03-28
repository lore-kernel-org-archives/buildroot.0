From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 28 Mar 2020 22:48:28 +0100
Subject: [Buildroot] [PATCH 1/2] package/libcec: bump version
Message-ID: <20200328214829.159717-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libcec/libcec.hash | 2 +-
 package/libcec/libcec.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libcec/libcec.hash b/package/libcec/libcec.hash
index 6790b417f1..c457ee7097 100644
--- a/package/libcec/libcec.hash
+++ b/package/libcec/libcec.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 4382a964bf8c511c22c03cdab5ba2d81c241536e6479072a61516966804f400a  libcec-4.0.4.tar.gz
+sha256 035c617e48e14b1d70c503c5fefce42142198e36fefa0f8b01f0228df65edb52  libcec-91da1b6d5daecd3c85a1ac06d325ee4554f69b83.tar.gz
 sha256 3618005b3db4eb8ede7292d233e6c41605cb8dcbd33e8790eff6e29c1e4f3789  COPYING
diff --git a/package/libcec/libcec.mk b/package/libcec/libcec.mk
index fe519d47ba..e85fd6a4d3 100644
--- a/package/libcec/libcec.mk
+++ b/package/libcec/libcec.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBCEC_VERSION = 4.0.4
-LIBCEC_SITE = $(call github,Pulse-Eight,libcec,libcec-$(LIBCEC_VERSION))
+LIBCEC_VERSION = 91da1b6d5daecd3c85a1ac06d325ee4554f69b83
+LIBCEC_SITE = $(call github,Pulse-Eight,libcec,$(LIBCEC_VERSION))
 LIBCEC_LICENSE = GPL-2.0+
 LIBCEC_LICENSE_FILES = COPYING
 
-- 
2.25.0
