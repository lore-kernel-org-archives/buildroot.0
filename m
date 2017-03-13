From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 13 Mar 2017 12:19:16 +0000
Subject: [Buildroot] [PATCH] python-dataproperty: bump version to 0.17.0
Message-ID: <20170313121916.46413-1-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/python-dataproperty/python-dataproperty.hash | 4 ++--
 package/python-dataproperty/python-dataproperty.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-dataproperty/python-dataproperty.hash b/package/python-dataproperty/python-dataproperty.hash
index d84b214..21b70b1 100644
--- a/package/python-dataproperty/python-dataproperty.hash
+++ b/package/python-dataproperty/python-dataproperty.hash
@@ -1,3 +1,3 @@
 # md5 from https://pypi.python.org/pypi/dataproperty/json, sha256 locally computed
-md5	a05cb97210d41677bde224b53562add4  DataProperty-0.16.2.tar.gz
-sha256	c2c6e1f2558bf03b0f8f2dc53a5eb00d9540babd3d69d299be878f2e32937e53  DataProperty-0.16.2.tar.gz
+md5 211c94a87f11e7e78fae61b20ee654a2  DataProperty-0.17.0.tar.gz
+sha256 6c7daed534e418badf5f0c8b601a353fed2fda40ec9b4e8052dfa8b40a5626a0  DataProperty-0.17.0.tar.gz
diff --git a/package/python-dataproperty/python-dataproperty.mk b/package/python-dataproperty/python-dataproperty.mk
index 997019c..b649d43 100644
--- a/package/python-dataproperty/python-dataproperty.mk
+++ b/package/python-dataproperty/python-dataproperty.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_DATAPROPERTY_VERSION = 0.16.2
+PYTHON_DATAPROPERTY_VERSION = 0.17.0
 PYTHON_DATAPROPERTY_SOURCE = DataProperty-$(PYTHON_DATAPROPERTY_VERSION).tar.gz
-PYTHON_DATAPROPERTY_SITE = https://pypi.python.org/packages/c8/95/4803e558a7e29ccf3adbf8f993ec53fe28c46df450892c4cc35c2f0ccedc
+PYTHON_DATAPROPERTY_SITE = https://pypi.python.org/packages/91/35/c47884269202d25f28007a303c2510141c15bd111225fd203fdf9474a0c7
 PYTHON_DATAPROPERTY_SETUP_TYPE = setuptools
 PYTHON_DATAPROPERTY_LICENSE = MIT
 PYTHON_DATAPROPERTY_LICENSE_FILES = LICENSE
-- 
2.10.2
