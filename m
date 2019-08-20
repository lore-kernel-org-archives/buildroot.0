From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 20 Aug 2019 20:48:03 +0200
Subject: [Buildroot] [PATCH/next 2/3] package/grpc: bump to version 1.23.0
In-Reply-To: <20190820184804.28911-1-fontaine.fabrice@gmail.com>
References: <20190820184804.28911-1-fontaine.fabrice@gmail.com>
Message-ID: <20190820184804.28911-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/grpc/grpc.hash | 2 +-
 package/grpc/grpc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/grpc/grpc.hash b/package/grpc/grpc.hash
index b915b40307..58f32c6b54 100644
--- a/package/grpc/grpc.hash
+++ b/package/grpc/grpc.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 069a52a166382dd7b99bf8e7e805f6af40d797cfcee5f80e530ca3fc75fd06e2 grpc-1.18.0.tar.gz
+sha256 f56ced18740895b943418fa29575a65cc2396ccfa3159fa40d318ef5f59471f9 grpc-1.23.0.tar.gz
 sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30 LICENSE
diff --git a/package/grpc/grpc.mk b/package/grpc/grpc.mk
index e3e5a87712..aeedbfd532 100644
--- a/package/grpc/grpc.mk
+++ b/package/grpc/grpc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GRPC_VERSION = 1.18.0
+GRPC_VERSION = 1.23.0
 GRPC_SITE = $(call github,grpc,grpc,v$(GRPC_VERSION))
 GRPC_LICENSE = Apache-2.0
 GRPC_LICENSE_FILES = LICENSE
-- 
2.20.1
