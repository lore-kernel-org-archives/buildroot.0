From: Asaf Kahlon <asafka7@gmail.com>
Date: Sat, 15 Dec 2018 10:37:23 +0200
Subject: [Buildroot] [PATCH 1/1] python-engineio: bump to verion 3.1.0
In-Reply-To: <20181215083723.25668-1-asafka7@gmail.com>
References: <20181215083723.25668-1-asafka7@gmail.com>
Message-ID: <20181215083723.25668-2-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-engineio/python-engineio.hash | 4 ++--
 package/python-engineio/python-engineio.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-engineio/python-engineio.hash b/package/python-engineio/python-engineio.hash
index 7a9a1fdad0..47e2333ecd 100644
--- a/package/python-engineio/python-engineio.hash
+++ b/package/python-engineio/python-engineio.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/python-engineio/json
-md5	a7930cb8bf957f1b12e1a21ae5b57982  python-engineio-3.0.0.tar.gz
-sha256	bb8b5888adb852614b4b1861586ee7d89145cbd2ebba03ed7043e64c029bbb3b  python-engineio-3.0.0.tar.gz
+md5	3e2428aa3b9ba1d1ff5b6bff2c306e7e  python-engineio-3.1.0.tar.gz
+sha256	d7341725001afded65e42620e26adc54a450cf4082dd54a407480cb9a64fcdf9  python-engineio-3.1.0.tar.gz
 # Locally computed sha256 checksums
 sha256	c9e97d3dbc1fbbcdb4f7808b282cd646db887aff4f5313fe6bbe8d4c31405a9c  LICENSE
diff --git a/package/python-engineio/python-engineio.mk b/package/python-engineio/python-engineio.mk
index 9bda632661..f31b948e3c 100644
--- a/package/python-engineio/python-engineio.mk
+++ b/package/python-engineio/python-engineio.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_ENGINEIO_VERSION = 3.0.0
-PYTHON_ENGINEIO_SITE = https://files.pythonhosted.org/packages/51/a4/1642a75f1206a14e9a75f286d38b1794b13e9ee3169f57cb939cb99ffea3
+PYTHON_ENGINEIO_VERSION = 3.1.0
+PYTHON_ENGINEIO_SITE = https://files.pythonhosted.org/packages/25/37/57dc050723f3e64a0a652711b3831263d99f5ade2e05e5d6038354be7eaa
 PYTHON_ENGINEIO_SETUP_TYPE = setuptools
 PYTHON_ENGINEIO_LICENSE = MIT
 PYTHON_ENGINEIO_LICENSE_FILES = LICENSE
-- 
2.19.1
