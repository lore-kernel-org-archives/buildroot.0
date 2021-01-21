From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 21 Jan 2021 22:04:39 +0100
Subject: [Buildroot] [git commit] package/yaml-cpp: set YAML_CPP_CPE_ID_VALID
Message-ID: <20210121205057.25A7E80DF5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=37fe2998efae39f83039e0b356985d5e3c15cc6f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:yaml-cpp_project:yaml-cpp is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Ayaml-cpp_project%3Ayaml-cpp

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/yaml-cpp/yaml-cpp.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/yaml-cpp/yaml-cpp.mk b/package/yaml-cpp/yaml-cpp.mk
index beb8d6f55f..d95380e621 100644
--- a/package/yaml-cpp/yaml-cpp.mk
+++ b/package/yaml-cpp/yaml-cpp.mk
@@ -9,6 +9,7 @@ YAML_CPP_SITE = $(call github,jbeder,yaml-cpp,yaml-cpp-$(YAML_CPP_VERSION))
 YAML_CPP_INSTALL_STAGING = YES
 YAML_CPP_LICENSE = MIT
 YAML_CPP_LICENSE_FILES = LICENSE
+YAML_CPP_CPE_ID_VALID = YES
 
 # Disable testing and parse tools
 YAML_CPP_CONF_OPTS += \
