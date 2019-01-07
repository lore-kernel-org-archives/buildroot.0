From: Asaf Kahlon <asafka7@gmail.com>
Date: Mon,  7 Jan 2019 21:16:53 +0200
Subject: [Buildroot] [PATCH 1/1] python-pytz: bump to version 2018.9
Message-ID: <20190107191653.25334-1-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-pytz/python-pytz.hash | 4 ++--
 package/python-pytz/python-pytz.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pytz/python-pytz.hash b/package/python-pytz/python-pytz.hash
index 78234ace81..525d452584 100644
--- a/package/python-pytz/python-pytz.hash
+++ b/package/python-pytz/python-pytz.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pytz/json
-md5	4b91594c440aa20c76ac92043efa75e1  pytz-2018.7.tar.gz
-sha256	31cb35c89bd7d333cd32c5f278fca91b523b0834369e757f4c5641ea252236ca  pytz-2018.7.tar.gz
+md5	0f57d76c64d0965e7429c9b871f6b711  pytz-2018.9.tar.gz
+sha256	d5f05e487007e29e03409f9398d074e158d920d36eb82eaf66fb1136b0c5374c  pytz-2018.9.tar.gz
 # Locally computed sha256 checksums
 sha256	39f07c72a1bfda349cbd27bac9bcb1e6f8c5b4e5cc3fadf56900406e8cc0b792  LICENSE.txt
diff --git a/package/python-pytz/python-pytz.mk b/package/python-pytz/python-pytz.mk
index dc6046d037..a93a12c084 100644
--- a/package/python-pytz/python-pytz.mk
+++ b/package/python-pytz/python-pytz.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYTZ_VERSION = 2018.7
+PYTHON_PYTZ_VERSION = 2018.9
 PYTHON_PYTZ_SOURCE = pytz-$(PYTHON_PYTZ_VERSION).tar.gz
-PYTHON_PYTZ_SITE = https://files.pythonhosted.org/packages/cd/71/ae99fc3df1b1c5267d37ef2c51b7d79c44ba8a5e37b48e3ca93b4d74d98b
+PYTHON_PYTZ_SITE = https://files.pythonhosted.org/packages/af/be/6c59e30e208a5f28da85751b93ec7b97e4612268bb054d0dff396e758a90
 PYTHON_PYTZ_SETUP_TYPE = setuptools
 PYTHON_PYTZ_LICENSE = MIT
 PYTHON_PYTZ_LICENSE_FILES = LICENSE.txt
-- 
2.19.1
