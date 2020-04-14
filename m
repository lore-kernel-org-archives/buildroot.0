From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 13 Apr 2020 19:22:42 -0600
Subject: [Buildroot] [PATCH 1/1] package/python-autobahn: bump to version
 20.4.1
Message-ID: <20200414012242.15871-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-autobahn/python-autobahn.hash | 4 ++--
 package/python-autobahn/python-autobahn.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-autobahn/python-autobahn.hash b/package/python-autobahn/python-autobahn.hash
index 1ecac0d5b7..3e4c167cfe 100644
--- a/package/python-autobahn/python-autobahn.hash
+++ b/package/python-autobahn/python-autobahn.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/autobahn/json
-md5  f4f7da4a23a9fa56bd299cc872b90538  autobahn-20.3.1.tar.gz
-sha256  88e150e4b3d284b83daafd8e0b289a5625ee00c633a2c580055bf1be2d391002  autobahn-20.3.1.tar.gz
+md5  d8a916d44eced92c3152ac59b2805118  autobahn-20.4.1.tar.gz
+sha256  6d3989e4d8b0e961c9d3bb1fe133099767bbd5080cea21b2bdc2a0a1b4581b2e  autobahn-20.4.1.tar.gz
 # Locally computed sha256 checksums
 sha256  0387eefce570453daaa60633f28676003731eeca28b2d0a0071c628e3a0004ef  LICENSE
diff --git a/package/python-autobahn/python-autobahn.mk b/package/python-autobahn/python-autobahn.mk
index 8b1e0e73b5..17bf338c24 100644
--- a/package/python-autobahn/python-autobahn.mk
+++ b/package/python-autobahn/python-autobahn.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AUTOBAHN_VERSION = 20.3.1
+PYTHON_AUTOBAHN_VERSION = 20.4.1
 PYTHON_AUTOBAHN_SOURCE = autobahn-$(PYTHON_AUTOBAHN_VERSION).tar.gz
-PYTHON_AUTOBAHN_SITE = https://files.pythonhosted.org/packages/54/bc/ec75ee259752ad65ddc30782a3128dadd79345f1aa0d4f76722996f37480
+PYTHON_AUTOBAHN_SITE = https://files.pythonhosted.org/packages/a3/2e/58f68840eef4a6740a41f59c5d3206a76e49993f90c954ae9777b120e09c
 PYTHON_AUTOBAHN_LICENSE = MIT
 PYTHON_AUTOBAHN_LICENSE_FILES = LICENSE
 PYTHON_AUTOBAHN_SETUP_TYPE = setuptools
-- 
2.20.1
