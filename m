From: Adam Duskett <aduskett@gmail.com>
Date: Sun, 19 Feb 2017 14:12:36 -0500
Subject: [Buildroot] [PATCH 39/58] python-pyro: bump to version 3.16
In-Reply-To: <20170219191255.1503-1-Adamduskett@outlook.com>
References: <20170219191255.1503-1-Adamduskett@outlook.com>
Message-ID: <20170219191255.1503-40-Adamduskett@outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
---
 package/python-pyro/python-pyro.hash | 5 +++--
 package/python-pyro/python-pyro.mk   | 4 ++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/python-pyro/python-pyro.hash b/package/python-pyro/python-pyro.hash
index 65ff0ae..4db42ef 100644
--- a/package/python-pyro/python-pyro.hash
+++ b/package/python-pyro/python-pyro.hash
@@ -1,2 +1,3 @@
-# locally computed
-sha256  f01e32f8d1c3f427c4916e13d9e8cee24dbf924f72922a06591515911bd13756  Pyro-3.14.tar.gz
+# md5 from https://pypi.python.org/pypi/pyro/json, sha256 locally computed
+md5 59d4d3f4a8786776c9d7f9051b8f1a69 Pyro-3.16.tar.gz
+sha256 1bed508453ef7a7556b51424a58101af2349b662baab7e7331c5cb85dbe7e578 Pyro-3.16.tar.gz
diff --git a/package/python-pyro/python-pyro.mk b/package/python-pyro/python-pyro.mk
index 26c026e..bf916ba 100644
--- a/package/python-pyro/python-pyro.mk
+++ b/package/python-pyro/python-pyro.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYRO_VERSION = 3.14
+PYTHON_PYRO_VERSION = 3.16
 PYTHON_PYRO_SOURCE = Pyro-$(PYTHON_PYRO_VERSION).tar.gz
-PYTHON_PYRO_SITE = https://pypi.python.org/packages/source/P/Pyro
+PYTHON_PYRO_SITE = https://pypi.python.org/packages/61/68/0978adae315261b87acd216517c2c7f00780396e4d1426c5412458c6a28f
 PYTHON_PYRO_LICENSE = MIT
 PYTHON_PYRO_LICENSE_FILES = LICENSE
 PYTHON_PYRO_SETUP_TYPE = distutils
-- 
2.9.3
