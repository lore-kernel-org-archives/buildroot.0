From: Etienne Carriere <etienne.carriere@linaro.org>
Date: Tue, 29 Oct 2019 15:41:28 +0100
Subject: [Buildroot] [PATCH 2/5] package/optee-client: bump version to 3.7.0
In-Reply-To: <f25cf981ca8a67c30ac2b994980a9f26aceb1dd2.1572355772.git.etienne.carriere@linaro.org>
References: <f25cf981ca8a67c30ac2b994980a9f26aceb1dd2.1572355772.git.etienne.carriere@linaro.org>
Message-ID: <5f70f6791ace3faa8891f49688de34bf1c919826.1572355772.git.etienne.carriere@linaro.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump OP-TEE Client package version to release 3.7.0.

Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
---
 package/optee-client/optee-client.hash | 4 ++--
 package/optee-client/optee-client.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/optee-client/optee-client.hash b/package/optee-client/optee-client.hash
index 010eb69275..3fae359f3a 100644
--- a/package/optee-client/optee-client.hash
+++ b/package/optee-client/optee-client.hash
@@ -1,4 +1,4 @@
-# From https://github.com/OP-TEE/optee_client/archive/3.5.0.tar.gz
-sha256 b7f6f8ac57c0c9b0cc59c34a2622b9ff3ae85676d2da10176fb2eaaa10716083  optee-client-3.5.0.tar.gz
+# From https://github.com/OP-TEE/optee_client/archive/3.7.0.tar.gz
+sha256 7a31076a3a77398c6db2b5d3e0a6ac297923bee126ff83430e8f1ebc2a060faa  optee-client-3.7.0.tar.gz
 # Locally computed
 sha256 fda8385993f112d7ca61b88b54ba5b4cbeec7e43a0f9b317d5186703c1985e8f  LICENSE
diff --git a/package/optee-client/optee-client.mk b/package/optee-client/optee-client.mk
index cf52b8e87e..15bebdc615 100644
--- a/package/optee-client/optee-client.mk
+++ b/package/optee-client/optee-client.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPTEE_CLIENT_VERSION = 3.5.0
+OPTEE_CLIENT_VERSION = 3.7.0
 OPTEE_CLIENT_SITE = $(call github,OP-TEE,optee_client,$(OPTEE_CLIENT_VERSION))
 OPTEE_CLIENT_LICENSE = BSD-2-Clause
 OPTEE_CLIENT_LICENSE_FILES = LICENSE
-- 
2.17.1
