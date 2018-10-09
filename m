From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue,  9 Oct 2018 21:13:08 +0200
Subject: [Buildroot] [PATCH 1/1] jasper: bump to version 2.0.14
Message-ID: <20181009191308.22634-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Update license to use SPDX short identifier
- Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/jasper/jasper.hash | 3 ++-
 package/jasper/jasper.mk   | 4 ++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/jasper/jasper.hash b/package/jasper/jasper.hash
index b2b82178eb..4fea367ebc 100644
--- a/package/jasper/jasper.hash
+++ b/package/jasper/jasper.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256 b50413b41bfc82ae419298b41eadcde1aa31f362fb9dc2ac089e5cbc19f60c24  jasper-version-2.0.13.tar.gz
+sha256 85266eea728f8b14365db9eaf1edc7be4c348704e562bb05095b9a077cf1a97b  jasper-version-2.0.14.tar.gz
+sha256 4ad1bb42aff888c4403d792e6e2c5f1716d6c279fea70b296333c9d577d30b81  LICENSE
diff --git a/package/jasper/jasper.mk b/package/jasper/jasper.mk
index 2aa3f9d554..b544a7c1c6 100644
--- a/package/jasper/jasper.mk
+++ b/package/jasper/jasper.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-JASPER_VERSION = version-2.0.13
+JASPER_VERSION = version-2.0.14
 JASPER_SITE = $(call github,mdadams,jasper,$(JASPER_VERSION))
 JASPER_INSTALL_STAGING = YES
-JASPER_LICENSE = JasPer License Version 2.0
+JASPER_LICENSE = JasPer-2.0
 JASPER_LICENSE_FILES = LICENSE
 JASPER_SUPPORTS_IN_SOURCE_BUILD = NO
 JASPER_CONF_OPTS = \
-- 
2.17.1
