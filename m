From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 15 Apr 2018 10:43:43 +0200
Subject: [Buildroot] [PATCH 1/1] flatbuffers: bump to version 1.9.0
Message-ID: <20180415084343.8982-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/flatbuffers/flatbuffers.hash | 2 +-
 package/flatbuffers/flatbuffers.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/flatbuffers/flatbuffers.hash b/package/flatbuffers/flatbuffers.hash
index bd39ca385b..a8f23f4ef9 100644
--- a/package/flatbuffers/flatbuffers.hash
+++ b/package/flatbuffers/flatbuffers.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256	c45029c0a0f1a88d416af143e34de96b3091642722aa2d8c090916c6d1498c2e	flatbuffers-v1.8.0.tar.gz
+sha256	5ca5491e4260cacae30f1a5786d109230db3f3a6e5a0eb45d0d0608293d247e3	flatbuffers-v1.9.0.tar.gz
 sha256	7ec9661a8afafab1eee3523d6f1a193eff76314a5ab10b4ce96aefd87621b0c3	LICENSE.txt
diff --git a/package/flatbuffers/flatbuffers.mk b/package/flatbuffers/flatbuffers.mk
index 2b640ecc2a..26d9307892 100644
--- a/package/flatbuffers/flatbuffers.mk
+++ b/package/flatbuffers/flatbuffers.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLATBUFFERS_VERSION = v1.8.0
+FLATBUFFERS_VERSION = v1.9.0
 FLATBUFFERS_SITE = $(call github,google,flatbuffers,$(FLATBUFFERS_VERSION))
 FLATBUFFERS_LICENSE = Apache-2.0
 FLATBUFFERS_LICENSE_FILES = LICENSE.txt
-- 
2.14.1
