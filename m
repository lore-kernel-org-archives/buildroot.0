From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 10 Oct 2018 21:18:28 +0200
Subject: [Buildroot] [git commit] jasper: update license
Message-ID: <20181010191727.1311682618@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ab666003e276e2e0624c70a4c4105f668f20b330
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add hash for license file and use SPDX short term identifier

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/jasper/jasper.hash | 1 +
 package/jasper/jasper.mk   | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/jasper/jasper.hash b/package/jasper/jasper.hash
index b2b82178eb..8c4f2453ad 100644
--- a/package/jasper/jasper.hash
+++ b/package/jasper/jasper.hash
@@ -1,2 +1,3 @@
 # Locally calculated
 sha256 b50413b41bfc82ae419298b41eadcde1aa31f362fb9dc2ac089e5cbc19f60c24  jasper-version-2.0.13.tar.gz
+sha256 4ad1bb42aff888c4403d792e6e2c5f1716d6c279fea70b296333c9d577d30b81  LICENSE
diff --git a/package/jasper/jasper.mk b/package/jasper/jasper.mk
index 2aa3f9d554..9dc46b18d6 100644
--- a/package/jasper/jasper.mk
+++ b/package/jasper/jasper.mk
@@ -7,7 +7,7 @@
 JASPER_VERSION = version-2.0.13
 JASPER_SITE = $(call github,mdadams,jasper,$(JASPER_VERSION))
 JASPER_INSTALL_STAGING = YES
-JASPER_LICENSE = JasPer License Version 2.0
+JASPER_LICENSE = JasPer-2.0
 JASPER_LICENSE_FILES = LICENSE
 JASPER_SUPPORTS_IN_SOURCE_BUILD = NO
 JASPER_CONF_OPTS = \
