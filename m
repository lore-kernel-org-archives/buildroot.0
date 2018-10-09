From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue,  9 Oct 2018 22:16:52 +0200
Subject: [Buildroot] [PATCH v2,2/2] jasper: bump to version 2.0.14
In-Reply-To: <20181009201652.17189-1-fontaine.fabrice@gmail.com>
References: <20181009201652.17189-1-fontaine.fabrice@gmail.com>
Message-ID: <20181009201652.17189-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Thomas Petazzoni):
 - Split patch in two: one for the license, the other one for bumping
   the version

 package/jasper/jasper.hash | 2 +-
 package/jasper/jasper.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/jasper/jasper.hash b/package/jasper/jasper.hash
index 8c4f2453ad..4fea367ebc 100644
--- a/package/jasper/jasper.hash
+++ b/package/jasper/jasper.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 b50413b41bfc82ae419298b41eadcde1aa31f362fb9dc2ac089e5cbc19f60c24  jasper-version-2.0.13.tar.gz
+sha256 85266eea728f8b14365db9eaf1edc7be4c348704e562bb05095b9a077cf1a97b  jasper-version-2.0.14.tar.gz
 sha256 4ad1bb42aff888c4403d792e6e2c5f1716d6c279fea70b296333c9d577d30b81  LICENSE
diff --git a/package/jasper/jasper.mk b/package/jasper/jasper.mk
index 9dc46b18d6..b544a7c1c6 100644
--- a/package/jasper/jasper.mk
+++ b/package/jasper/jasper.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JASPER_VERSION = version-2.0.13
+JASPER_VERSION = version-2.0.14
 JASPER_SITE = $(call github,mdadams,jasper,$(JASPER_VERSION))
 JASPER_INSTALL_STAGING = YES
 JASPER_LICENSE = JasPer-2.0
-- 
2.17.1
