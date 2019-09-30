From: Asaf Kahlon <asafka7@gmail.com>
Date: Mon, 30 Sep 2019 15:32:59 +0300
Subject: [Buildroot] [PATCH 1/1] package/python-werkzeug: bump to version
 0.16.0
In-Reply-To: <20190930123302.28215-1-asafka7@gmail.com>
References: <20190930123302.28215-1-asafka7@gmail.com>
Message-ID: <20190930123302.28215-33-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-werkzeug/python-werkzeug.hash | 7 ++++---
 package/python-werkzeug/python-werkzeug.mk   | 4 ++--
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/python-werkzeug/python-werkzeug.hash b/package/python-werkzeug/python-werkzeug.hash
index 84f1e2d624..cc90fe140b 100644
--- a/package/python-werkzeug/python-werkzeug.hash
+++ b/package/python-werkzeug/python-werkzeug.hash
@@ -1,4 +1,5 @@
-# md5 from https://pypi.python.org/pypi/Werkzeug/json, sha256 locally computed
-md5	7c02923f7d898844079f12e28e32e3f8  Werkzeug-0.15.2.tar.gz
-sha256	0a73e8bb2ff2feecfc5d56e6f458f5b99290ef34f565ffb2665801ff7de6af7a  Werkzeug-0.15.2.tar.gz
+# md5, sha256 from https://pypi.org/pypi/werkzeug/json
+md5	5b23b4953efc4f52b1d0b33af6f7cd2d  Werkzeug-0.16.0.tar.gz
+sha256	7280924747b5733b246fe23972186c6b348f9ae29724135a6dfc1e53cea433e7  Werkzeug-0.16.0.tar.gz
+# Locally computed sha256 checksums
 sha256	3b49dcee4105eb37bac10faf1be260408fe85d252b8e9df2e0979fc1e094437b  LICENSE.rst
diff --git a/package/python-werkzeug/python-werkzeug.mk b/package/python-werkzeug/python-werkzeug.mk
index a2e3bcfbcf..fea25f8ee8 100644
--- a/package/python-werkzeug/python-werkzeug.mk
+++ b/package/python-werkzeug/python-werkzeug.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_WERKZEUG_VERSION = 0.15.2
+PYTHON_WERKZEUG_VERSION = 0.16.0
 PYTHON_WERKZEUG_SOURCE = Werkzeug-$(PYTHON_WERKZEUG_VERSION).tar.gz
-PYTHON_WERKZEUG_SITE = https://files.pythonhosted.org/packages/f3/c8/fa7e1a0283267bee8efa10c665d8dca27e591face7e333c789c85671b3ab
+PYTHON_WERKZEUG_SITE = https://files.pythonhosted.org/packages/5e/fd/eb19e4f6a806cd6ee34900a687f181001c7a0059ff914752091aba84681f
 PYTHON_WERKZEUG_SETUP_TYPE = setuptools
 PYTHON_WERKZEUG_LICENSE = BSD-3-Clause
 PYTHON_WERKZEUG_LICENSE_FILES = LICENSE.rst
-- 
2.20.1
