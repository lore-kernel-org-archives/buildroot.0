From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 19 Sep 2020 16:19:21 -0600
Subject: [Buildroot] [PATCH 1/1] package/python-brotli: bump to version 1.0.9
Message-ID: <20200919221921.3775986-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-brotli/python-brotli.hash | 6 +++---
 package/python-brotli/python-brotli.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-brotli/python-brotli.hash b/package/python-brotli/python-brotli.hash
index eaf59ae71e..de4964dd25 100644
--- a/package/python-brotli/python-brotli.hash
+++ b/package/python-brotli/python-brotli.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/brotli/json
-md5	3444b534e86f65f9f229fd123965be87  Brotli-1.0.7.zip
-sha256	0538dc1744fd17c314d2adc409ea7d1b779783b89fd95bcfb0c2acc93a6ea5a7  Brotli-1.0.7.zip
+md5  08f1f098697c64aa4596468b556d0c94  Brotli-1.0.9.zip
+sha256  4d1b810aa0ed773f81dceda2cc7b403d01057458730e309856356d4ef4188438  Brotli-1.0.9.zip
 # Locally computed sha256 checksums
-sha256	3d180008e36922a4e8daec11c34c7af264fed5962d07924aea928c38e8663c94  LICENSE
+sha256  3d180008e36922a4e8daec11c34c7af264fed5962d07924aea928c38e8663c94  LICENSE
diff --git a/package/python-brotli/python-brotli.mk b/package/python-brotli/python-brotli.mk
index 2ec549ed0c..ff78e6ab2c 100644
--- a/package/python-brotli/python-brotli.mk
+++ b/package/python-brotli/python-brotli.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BROTLI_VERSION = 1.0.7
+PYTHON_BROTLI_VERSION = 1.0.9
 PYTHON_BROTLI_SOURCE = Brotli-$(PYTHON_BROTLI_VERSION).zip
-PYTHON_BROTLI_SITE = https://files.pythonhosted.org/packages/cd/9c/7955895f5672ecc85270244582c6b53ff95bb4c24bf77bd9271d42351635
+PYTHON_BROTLI_SITE = https://files.pythonhosted.org/packages/2a/18/70c32fe9357f3eea18598b23aa9ed29b1711c3001835f7cf99a9818985d0
 PYTHON_BROTLI_SETUP_TYPE = setuptools
 PYTHON_BROTLI_LICENSE = MIT
 PYTHON_BROTLI_LICENSE_FILES = LICENSE
-- 
2.25.1
