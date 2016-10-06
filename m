From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu,  6 Oct 2016 21:29:44 +0200
Subject: [Buildroot] [PATCH 17/21] package/python-urllib3: bump version to
	1.18
In-Reply-To: <20161006192948.27956-1-bernd.kuhls@t-online.de>
References: <20161006192948.27956-1-bernd.kuhls@t-online.de>
Message-ID: <20161006192948.27956-17-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/python-urllib3/python-urllib3.hash | 6 +++---
 package/python-urllib3/python-urllib3.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-urllib3/python-urllib3.hash b/package/python-urllib3/python-urllib3.hash
index 266b8e9..fb5fd9d 100644
--- a/package/python-urllib3/python-urllib3.hash
+++ b/package/python-urllib3/python-urllib3.hash
@@ -1,3 +1,3 @@
-# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=5e1407428ac33b521c71a7ac273b3847, sha256 locally computed
-md5     5e1407428ac33b521c71a7ac273b3847  urllib3-1.14.tar.gz
-sha256  dd4fb13a4ce50b18338c7e4d665b21fd38632c5d4b1d9f1a1379276bd3c08d37  urllib3-1.14.tar.gz
+# md5 from https://pypi.python.org/pypi/urllib3/json, sha256 locally computed
+md5	1eadd93bd5e58d3528d977111f2997ea  urllib3-1.18.tar.gz
+sha256	d30dd4d1cbbc36ebab6e4a2076820cfe0c60f10adf087fecbc5a3edae79fdc81  urllib3-1.18.tar.gz
diff --git a/package/python-urllib3/python-urllib3.mk b/package/python-urllib3/python-urllib3.mk
index 0101053..9043aa3 100644
--- a/package/python-urllib3/python-urllib3.mk
+++ b/package/python-urllib3/python-urllib3.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_URLLIB3_VERSION = 1.14
+PYTHON_URLLIB3_VERSION = 1.18
 PYTHON_URLLIB3_SOURCE = urllib3-$(PYTHON_URLLIB3_VERSION).tar.gz
-PYTHON_URLLIB3_SITE = https://pypi.python.org/packages/source/u/urllib3
+PYTHON_URLLIB3_SITE = https://pypi.python.org/packages/8f/45/7434a6a44d42744b74fb969a39720f0c3d4f31f921737e51a69d8b15c859
 PYTHON_URLLIB3_LICENSE = MIT
 PYTHON_URLLIB3_LICENSE_FILES = LICENSE.txt
 PYTHON_URLLIB3_SETUP_TYPE = setuptools
-- 
2.9.3
