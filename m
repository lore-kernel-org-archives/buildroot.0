From: Etienne Carriere <etienne.carriere@linaro.org>
Date: Fri, 29 May 2020 16:27:39 +0200
Subject: [Buildroot] [PATCH 2/5] package/optee-client: bump to version 3.9.0
In-Reply-To: <20200529142742.9381-1-etienne.carriere@linaro.org>
References: <20200529142742.9381-1-etienne.carriere@linaro.org>
Message-ID: <20200529142742.9381-2-etienne.carriere@linaro.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump OP-TEE Client package version to OP-TEE release 3.9.0.

Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
---
 package/optee-client/optee-client.hash | 4 ++--
 package/optee-client/optee-client.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/optee-client/optee-client.hash b/package/optee-client/optee-client.hash
index 3fae359f3a..b08ebc38c0 100644
--- a/package/optee-client/optee-client.hash
+++ b/package/optee-client/optee-client.hash
@@ -1,4 +1,4 @@
-# From https://github.com/OP-TEE/optee_client/archive/3.7.0.tar.gz
-sha256 7a31076a3a77398c6db2b5d3e0a6ac297923bee126ff83430e8f1ebc2a060faa  optee-client-3.7.0.tar.gz
+# From https://github.com/OP-TEE/optee_client/archive/3.9.0.tar.gz
+sha256 1b072e6be8a697656e9fe34499789bbd4132b3720f8d1b95c659e8e6c5873654  optee-client-3.9.0.tar.gz
 # Locally computed
 sha256 fda8385993f112d7ca61b88b54ba5b4cbeec7e43a0f9b317d5186703c1985e8f  LICENSE
diff --git a/package/optee-client/optee-client.mk b/package/optee-client/optee-client.mk
index 64235b41e4..842ba8a81a 100644
--- a/package/optee-client/optee-client.mk
+++ b/package/optee-client/optee-client.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPTEE_CLIENT_VERSION = 3.7.0
+OPTEE_CLIENT_VERSION = 3.9.0
 OPTEE_CLIENT_SITE = $(call github,OP-TEE,optee_client,$(OPTEE_CLIENT_VERSION))
 OPTEE_CLIENT_LICENSE = BSD-2-Clause
 OPTEE_CLIENT_LICENSE_FILES = LICENSE
-- 
2.17.1
