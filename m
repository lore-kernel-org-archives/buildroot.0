From: Asaf Kahlon <asafka7@gmail.com>
Date: Fri,  4 Oct 2019 21:31:13 +0300
Subject: [Buildroot] [PATCH 1/1] package/python-netifaces: bump to version
 0.10.9
In-Reply-To: <20191004183132.15564-1-asafka7@gmail.com>
References: <20191004183132.15564-1-asafka7@gmail.com>
Message-ID: <20191004183132.15564-7-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update license file to LICENSE which is now included (and add hash).

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-netifaces/python-netifaces.hash | 8 +++++---
 package/python-netifaces/python-netifaces.mk   | 6 +++---
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/package/python-netifaces/python-netifaces.hash b/package/python-netifaces/python-netifaces.hash
index 335f907d59..f59208014b 100644
--- a/package/python-netifaces/python-netifaces.hash
+++ b/package/python-netifaces/python-netifaces.hash
@@ -1,3 +1,5 @@
-# md5 from https://pypi.python.org/pypi/netifaces/json, sha256 locally computed
-md5	1d424cb5ef52907c5ab913011122a98b  netifaces-0.10.6.tar.gz
-sha256	0c4da523f36d36f1ef92ee183f2512f3ceb9a9d2a45f7d19cda5a42c6689ebe0  netifaces-0.10.6.tar.gz
+# md5, sha256 from https://pypi.org/pypi/netifaces/json
+md5	de92cc322b4f56047c073f802ad77860  netifaces-0.10.9.tar.gz
+sha256	2dee9ffdd16292878336a58d04a20f0ffe95555465fee7c9bd23b3490ef2abf3  netifaces-0.10.9.tar.gz
+# Locally computed sha256 checksums
+sha256	b20b895164b72b9cc0170e6c0d60b14f9aaacc6862c0556eed41eaa348883705  LICENSE
diff --git a/package/python-netifaces/python-netifaces.mk b/package/python-netifaces/python-netifaces.mk
index 3258be7a95..502529c008 100644
--- a/package/python-netifaces/python-netifaces.mk
+++ b/package/python-netifaces/python-netifaces.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-PYTHON_NETIFACES_VERSION = 0.10.6
+PYTHON_NETIFACES_VERSION = 0.10.9
 PYTHON_NETIFACES_SOURCE = netifaces-$(PYTHON_NETIFACES_VERSION).tar.gz
-PYTHON_NETIFACES_SITE = https://pypi.python.org/packages/72/01/ba076082628901bca750bf53b322a8ff10c1d757dc29196a8e6082711c9d
+PYTHON_NETIFACES_SITE = https://files.pythonhosted.org/packages/0d/18/fd6e9c71a35b67a73160ec80a49da63d1eed2d2055054cc2995714949132
 PYTHON_NETIFACES_LICENSE = MIT
-PYTHON_NETIFACES_LICENSE_FILES = README.rst
+PYTHON_NETIFACES_LICENSE_FILES = LICENSE
 PYTHON_NETIFACES_SETUP_TYPE = setuptools
 
 $(eval $(python-package))
-- 
2.20.1
