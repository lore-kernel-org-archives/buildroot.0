From: aduskett at gmail.com <aduskett@gmail.com>
Date: Tue, 30 Apr 2019 09:19:12 -0400
Subject: [Buildroot] [PATCH 04/11] package/python-werkzeug: bump to version
 0.15.2
In-Reply-To: <20190430131919.130128-1-aduskett@gmail.com>
References: <20190430131919.130128-1-aduskett@gmail.com>
Message-ID: <20190430131919.130128-5-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Also add hash for the license file, and change the license file to LICENSE.rst
as LICENSE no longer exists.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/python-werkzeug/python-werkzeug.hash | 5 +++--
 package/python-werkzeug/python-werkzeug.mk   | 6 +++---
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/python-werkzeug/python-werkzeug.hash b/package/python-werkzeug/python-werkzeug.hash
index 4b2075071e..84f1e2d624 100644
--- a/package/python-werkzeug/python-werkzeug.hash
+++ b/package/python-werkzeug/python-werkzeug.hash
@@ -1,3 +1,4 @@
 # md5 from https://pypi.python.org/pypi/Werkzeug/json, sha256 locally computed
-md5	e385b2c5a7193cff24c689b31e1124dc  Werkzeug-0.12.2.tar.gz
-sha256	903a7b87b74635244548b30d30db4c8947fe64c5198f58899ddcd3a13c23bb26  Werkzeug-0.12.2.tar.gz
+md5	7c02923f7d898844079f12e28e32e3f8  Werkzeug-0.15.2.tar.gz
+sha256	0a73e8bb2ff2feecfc5d56e6f458f5b99290ef34f565ffb2665801ff7de6af7a  Werkzeug-0.15.2.tar.gz
+sha256	3b49dcee4105eb37bac10faf1be260408fe85d252b8e9df2e0979fc1e094437b  LICENSE.rst
diff --git a/package/python-werkzeug/python-werkzeug.mk b/package/python-werkzeug/python-werkzeug.mk
index 6d478f7c11..a2e3bcfbcf 100644
--- a/package/python-werkzeug/python-werkzeug.mk
+++ b/package/python-werkzeug/python-werkzeug.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-PYTHON_WERKZEUG_VERSION = 0.12.2
+PYTHON_WERKZEUG_VERSION = 0.15.2
 PYTHON_WERKZEUG_SOURCE = Werkzeug-$(PYTHON_WERKZEUG_VERSION).tar.gz
-PYTHON_WERKZEUG_SITE = https://pypi.python.org/packages/56/41/c095a77eb2dd69bf278dd664a97d3416af04e9ba1a00b8c138f772741d31
+PYTHON_WERKZEUG_SITE = https://files.pythonhosted.org/packages/f3/c8/fa7e1a0283267bee8efa10c665d8dca27e591face7e333c789c85671b3ab
 PYTHON_WERKZEUG_SETUP_TYPE = setuptools
 PYTHON_WERKZEUG_LICENSE = BSD-3-Clause
-PYTHON_WERKZEUG_LICENSE_FILES = LICENSE
+PYTHON_WERKZEUG_LICENSE_FILES = LICENSE.rst
 
 $(eval $(python-package))
-- 
2.20.1
