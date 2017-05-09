From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 9 May 2017 12:15:13 +0100
Subject: [Buildroot] [PATCH next 2/2] python-dataproperty: bump version to
	0.21.1
In-Reply-To: <20170509111513.64192-1-Vincent.Riera@imgtec.com>
References: <20170509111513.64192-1-Vincent.Riera@imgtec.com>
Message-ID: <20170509111513.64192-2-Vincent.Riera@imgtec.com>
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
index 1ab0a40..ad88498 100644
--- a/package/python-dataproperty/python-dataproperty.hash
+++ b/package/python-dataproperty/python-dataproperty.hash
@@ -1,3 +1,3 @@
 # md5 from https://pypi.python.org/pypi/dataproperty/json, sha256 locally computed
-md5 70199d3e6e021810d0d3b4a42c37916f  DataProperty-0.18.1.tar.gz
-sha256 950131bd9fb874be606835e5f4a84d99f505d919aed94145932ec010190c7c66  DataProperty-0.18.1.tar.gz
+md5 89e78396b91e6156c522175b3316546f  DataProperty-0.21.1.tar.gz
+sha256 7a5c77004e8f1bca734838966e30e555e323c06bda613ed3985fa9bef2665c71  DataProperty-0.21.1.tar.gz
diff --git a/package/python-dataproperty/python-dataproperty.mk b/package/python-dataproperty/python-dataproperty.mk
index 7e34425..d9d0783 100644
--- a/package/python-dataproperty/python-dataproperty.mk
+++ b/package/python-dataproperty/python-dataproperty.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_DATAPROPERTY_VERSION = 0.18.1
+PYTHON_DATAPROPERTY_VERSION = 0.21.1
 PYTHON_DATAPROPERTY_SOURCE = DataProperty-$(PYTHON_DATAPROPERTY_VERSION).tar.gz
-PYTHON_DATAPROPERTY_SITE = https://pypi.python.org/packages/42/b6/591366869e9fc7b19420ca4c177727f25dcccc07a46cecbda8d6abffa866
+PYTHON_DATAPROPERTY_SITE = https://pypi.python.org/packages/fc/9a/e6cc202b81b02aec39f35f2d13a6efc349cdc62ae3890f84b586468597ad
 PYTHON_DATAPROPERTY_SETUP_TYPE = setuptools
 PYTHON_DATAPROPERTY_LICENSE = MIT
 PYTHON_DATAPROPERTY_LICENSE_FILES = LICENSE
-- 
2.10.2
