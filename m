From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 5 Oct 2019 16:59:24 +0200
Subject: [Buildroot] [git commit] package/python-pyftpdlib: bump to version
 1.5.5
Message-ID: <20191005150350.29EB080E57@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1561165a656b1d404cc61f4d9a379f907eea8ab6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also add hash for license file.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/python-pyftpdlib/python-pyftpdlib.hash | 9 +++++----
 package/python-pyftpdlib/python-pyftpdlib.mk   | 4 ++--
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/package/python-pyftpdlib/python-pyftpdlib.hash b/package/python-pyftpdlib/python-pyftpdlib.hash
index 3ed16018df..7f8da95550 100644
--- a/package/python-pyftpdlib/python-pyftpdlib.hash
+++ b/package/python-pyftpdlib/python-pyftpdlib.hash
@@ -1,4 +1,5 @@
-# md5 from https://pypi.python.org/pypi/pyftpdlib/json, sha256 locally computed
-md5	f1c7e7f859b3310769149dea4ac26916  pyftpdlib-1.5.3.tar.gz
-sha256	7b9ea701f91bee280c5a930a9c4ceaea91b6d4aaf82b8b8ede82fb84a32081a7  pyftpdlib-1.5.3.tar.gz
-sha256  18a4ff1ddf890838e36504b307581e3eb42c890a7272ce28b18b3ce1205b7ea8  LICENSE
+# md5, sha256 from https://pypi.org/pypi/pyftpdlib/json
+md5	7f8089520d60171bee5dab2b721e8d00  pyftpdlib-1.5.5.tar.gz
+sha256	1adf1c03d1508749e7c2f26dc9850ec0ef834318d725b7ae5ac91698f5c86752  pyftpdlib-1.5.5.tar.gz
+# Locally computed sha256 checksums
+sha256	18a4ff1ddf890838e36504b307581e3eb42c890a7272ce28b18b3ce1205b7ea8  LICENSE
diff --git a/package/python-pyftpdlib/python-pyftpdlib.mk b/package/python-pyftpdlib/python-pyftpdlib.mk
index a34b563cb7..dbbb9e2842 100644
--- a/package/python-pyftpdlib/python-pyftpdlib.mk
+++ b/package/python-pyftpdlib/python-pyftpdlib.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYFTPDLIB_VERSION = 1.5.3
+PYTHON_PYFTPDLIB_VERSION = 1.5.5
 PYTHON_PYFTPDLIB_SOURCE = pyftpdlib-$(PYTHON_PYFTPDLIB_VERSION).tar.gz
-PYTHON_PYFTPDLIB_SITE = https://pypi.python.org/packages/c5/fb/74f6425fbb7f2a87969e1aa01bb9684601de431a3488b95f64509bf985ef
+PYTHON_PYFTPDLIB_SITE = https://files.pythonhosted.org/packages/27/64/06a574350c79873e908fa9f48b617e7961de50fc468acc0a05d76771bce9
 PYTHON_PYFTPDLIB_SETUP_TYPE = setuptools
 PYTHON_PYFTPDLIB_LICENSE = MIT
 PYTHON_PYFTPDLIB_LICENSE_FILES = LICENSE
