From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 30 Sep 2019 23:18:09 +0200
Subject: [Buildroot] [git commit] package/yaml-cpp: bump version to 0.6.3
Message-ID: <20190930211446.5CA9E83FFC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=68dd5ab1affe95bc031f2a2a66317ba9244a1941
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/yaml-cpp/yaml-cpp.hash | 2 +-
 package/yaml-cpp/yaml-cpp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/yaml-cpp/yaml-cpp.hash b/package/yaml-cpp/yaml-cpp.hash
index b2c0214102..2f7a6fc639 100644
--- a/package/yaml-cpp/yaml-cpp.hash
+++ b/package/yaml-cpp/yaml-cpp.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  e4d8560e163c3d875fd5d9e5542b5fd5bec810febdcba61481fe5fc4e6b1fd05  yaml-cpp-0.6.2.tar.gz
+sha256  77ea1b90b3718aa0c324207cb29418f5bced2354c2e483a9523d98c3460af1ed  yaml-cpp-0.6.3.tar.gz
 sha256  aa6fcc27be034e41e21dd832f9175bfe694a48491d9e14ff0fa278e19ad14f1b  LICENSE
diff --git a/package/yaml-cpp/yaml-cpp.mk b/package/yaml-cpp/yaml-cpp.mk
index 97021ea421..906e554ed7 100644
--- a/package/yaml-cpp/yaml-cpp.mk
+++ b/package/yaml-cpp/yaml-cpp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-YAML_CPP_VERSION = 0.6.2
+YAML_CPP_VERSION = 0.6.3
 YAML_CPP_SITE = $(call github,jbeder,yaml-cpp,yaml-cpp-$(YAML_CPP_VERSION))
 YAML_CPP_INSTALL_STAGING = YES
 YAML_CPP_LICENSE = MIT
