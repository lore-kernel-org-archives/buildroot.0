From: Asaf Kahlon <asafka7@gmail.com>
Date: Thu, 25 Oct 2018 20:12:20 +0300
Subject: [Buildroot] [PATCH 1/1] python-pytz: bump to version 2018.6
In-Reply-To: <20181025171220.10037-1-asafka7@gmail.com>
References: <20181025171220.10037-1-asafka7@gmail.com>
Message-ID: <20181025171220.10037-2-asafka7@gmail.com>
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
index 0b1a0b5501..5634d5d624 100644
--- a/package/python-pytz/python-pytz.hash
+++ b/package/python-pytz/python-pytz.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pytz/json
-md5	45409cbfa3927bdd2f3ee914dd5b1060  pytz-2018.5.tar.gz
-sha256	ffb9ef1de172603304d9d2819af6f5ece76f2e85ec10692a524dd876e72bf277  pytz-2018.5.tar.gz
+md5	6c92d86f9e92e71c561b1adc213feba0  pytz-2018.6.tar.gz
+sha256	642253af8eae734d1509fc6ac9c1aee5e5b69d76392660889979b9870610a46b  pytz-2018.6.tar.gz
 # Locally computed sha256 checksums
 sha256	39f07c72a1bfda349cbd27bac9bcb1e6f8c5b4e5cc3fadf56900406e8cc0b792  LICENSE.txt
diff --git a/package/python-pytz/python-pytz.mk b/package/python-pytz/python-pytz.mk
index 4ddc3f9df0..9a0ea19375 100644
--- a/package/python-pytz/python-pytz.mk
+++ b/package/python-pytz/python-pytz.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYTZ_VERSION = 2018.5
+PYTHON_PYTZ_VERSION = 2018.6
 PYTHON_PYTZ_SOURCE = pytz-$(PYTHON_PYTZ_VERSION).tar.gz
-PYTHON_PYTZ_SITE = https://files.pythonhosted.org/packages/ca/a9/62f96decb1e309d6300ebe7eee9acfd7bccaeedd693794437005b9067b44
+PYTHON_PYTZ_SITE = https://files.pythonhosted.org/packages/c7/df/68a3331691a604a8241335064cf20742338d66eb008da96d4c9f3e3d4c41
 PYTHON_PYTZ_SETUP_TYPE = setuptools
 PYTHON_PYTZ_LICENSE = MIT
 PYTHON_PYTZ_LICENSE_FILES = LICENSE.txt
-- 
2.17.1
