From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 24 Apr 2017 10:43:16 +0100
Subject: [Buildroot] [PATCH] python-dataproperty: bump version to 0.18.1
Message-ID: <20170424094316.60728-1-Vincent.Riera@imgtec.com>
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
index 21b70b1..1ab0a40 100644
--- a/package/python-dataproperty/python-dataproperty.hash
+++ b/package/python-dataproperty/python-dataproperty.hash
@@ -1,3 +1,3 @@
 # md5 from https://pypi.python.org/pypi/dataproperty/json, sha256 locally computed
-md5 211c94a87f11e7e78fae61b20ee654a2  DataProperty-0.17.0.tar.gz
-sha256 6c7daed534e418badf5f0c8b601a353fed2fda40ec9b4e8052dfa8b40a5626a0  DataProperty-0.17.0.tar.gz
+md5 70199d3e6e021810d0d3b4a42c37916f  DataProperty-0.18.1.tar.gz
+sha256 950131bd9fb874be606835e5f4a84d99f505d919aed94145932ec010190c7c66  DataProperty-0.18.1.tar.gz
diff --git a/package/python-dataproperty/python-dataproperty.mk b/package/python-dataproperty/python-dataproperty.mk
index b649d43..7e34425 100644
--- a/package/python-dataproperty/python-dataproperty.mk
+++ b/package/python-dataproperty/python-dataproperty.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_DATAPROPERTY_VERSION = 0.17.0
+PYTHON_DATAPROPERTY_VERSION = 0.18.1
 PYTHON_DATAPROPERTY_SOURCE = DataProperty-$(PYTHON_DATAPROPERTY_VERSION).tar.gz
-PYTHON_DATAPROPERTY_SITE = https://pypi.python.org/packages/91/35/c47884269202d25f28007a303c2510141c15bd111225fd203fdf9474a0c7
+PYTHON_DATAPROPERTY_SITE = https://pypi.python.org/packages/42/b6/591366869e9fc7b19420ca4c177727f25dcccc07a46cecbda8d6abffa866
 PYTHON_DATAPROPERTY_SETUP_TYPE = setuptools
 PYTHON_DATAPROPERTY_LICENSE = MIT
 PYTHON_DATAPROPERTY_LICENSE_FILES = LICENSE
-- 
2.10.2
