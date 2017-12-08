From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 8 Dec 2017 14:40:59 +0100
Subject: [Buildroot] [git commit] python-pyftpdlib: bump to version 1.5.3
Message-ID: <20171208133433.0FFDC815DB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=87daef6fdde4613ee0720375e4cca5199fa36e85
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add licence checksum.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-pyftpdlib/python-pyftpdlib.hash | 7 ++++---
 package/python-pyftpdlib/python-pyftpdlib.mk   | 4 ++--
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/python-pyftpdlib/python-pyftpdlib.hash b/package/python-pyftpdlib/python-pyftpdlib.hash
index 9726f9f..3ed1601 100644
--- a/package/python-pyftpdlib/python-pyftpdlib.hash
+++ b/package/python-pyftpdlib/python-pyftpdlib.hash
@@ -1,3 +1,4 @@
-# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=61b23e2362df23d0dfa5fe76f6e2ab55, sha256 locally computed
-md5  61b23e2362df23d0dfa5fe76f6e2ab55  pyftpdlib-1.5.1.tar.gz
-sha256  7bcd7fc825123414a157718c6dcdcb0978208d3c865d4650564acef4acce3354  pyftpdlib-1.5.1.tar.gz
+# md5 from https://pypi.python.org/pypi/pyftpdlib/json, sha256 locally computed
+md5	f1c7e7f859b3310769149dea4ac26916  pyftpdlib-1.5.3.tar.gz
+sha256	7b9ea701f91bee280c5a930a9c4ceaea91b6d4aaf82b8b8ede82fb84a32081a7  pyftpdlib-1.5.3.tar.gz
+sha256  18a4ff1ddf890838e36504b307581e3eb42c890a7272ce28b18b3ce1205b7ea8  LICENSE
diff --git a/package/python-pyftpdlib/python-pyftpdlib.mk b/package/python-pyftpdlib/python-pyftpdlib.mk
index 85d0b56..a34b563 100644
--- a/package/python-pyftpdlib/python-pyftpdlib.mk
+++ b/package/python-pyftpdlib/python-pyftpdlib.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYFTPDLIB_VERSION = 1.5.1
+PYTHON_PYFTPDLIB_VERSION = 1.5.3
 PYTHON_PYFTPDLIB_SOURCE = pyftpdlib-$(PYTHON_PYFTPDLIB_VERSION).tar.gz
-PYTHON_PYFTPDLIB_SITE = https://pypi.python.org/packages/a8/f8/0f6db156898616dbcbd7bf865660295c81479071ab0fcd1898fe1b3a4fc4
+PYTHON_PYFTPDLIB_SITE = https://pypi.python.org/packages/c5/fb/74f6425fbb7f2a87969e1aa01bb9684601de431a3488b95f64509bf985ef
 PYTHON_PYFTPDLIB_SETUP_TYPE = setuptools
 PYTHON_PYFTPDLIB_LICENSE = MIT
 PYTHON_PYFTPDLIB_LICENSE_FILES = LICENSE
