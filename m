From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Oct 2016 23:00:35 +0200
Subject: [Buildroot] [git commit] package/python-flask-jsonrpc: bump version
	to 0.3.1
Message-ID: <20161005210758.252F17FF86@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4f968aa6f839390d70c81ca487827cc24e690cb6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-flask-jsonrpc/python-flask-jsonrpc.hash | 6 +++---
 package/python-flask-jsonrpc/python-flask-jsonrpc.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-flask-jsonrpc/python-flask-jsonrpc.hash b/package/python-flask-jsonrpc/python-flask-jsonrpc.hash
index 8b91af7..a25fbb7 100644
--- a/package/python-flask-jsonrpc/python-flask-jsonrpc.hash
+++ b/package/python-flask-jsonrpc/python-flask-jsonrpc.hash
@@ -1,3 +1,3 @@
-# md5 from https://pypi.python.org/pypi/Flask-JSONRPC/0.3, sha256 locally computed:
-md5    a5beca4c3a882315f9b81acb57e83c68                                 Flask-JSONRPC-0.3.tar.gz
-sha256 5baf70bf9cf955e95c02316982026a122b89a5f4c78c5b26f9f476abdb3e13bc Flask-JSONRPC-0.3.tar.gz
+# md5 from https://pypi.python.org/pypi/flask-jsonrpc/json, sha256 locally computed
+md5	5c0592f53b2f18e34d5be435acee8842  Flask-JSONRPC-0.3.1.tar.gz
+sha256	4d0cc9c20874093306af91f5a48009fb8659a041428dcdb11703598ffbbc97d0  Flask-JSONRPC-0.3.1.tar.gz
diff --git a/package/python-flask-jsonrpc/python-flask-jsonrpc.mk b/package/python-flask-jsonrpc/python-flask-jsonrpc.mk
index 624322e..ade39e1 100644
--- a/package/python-flask-jsonrpc/python-flask-jsonrpc.mk
+++ b/package/python-flask-jsonrpc/python-flask-jsonrpc.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FLASK_JSONRPC_VERSION = 0.3
+PYTHON_FLASK_JSONRPC_VERSION = 0.3.1
 PYTHON_FLASK_JSONRPC_SOURCE = Flask-JSONRPC-$(PYTHON_FLASK_JSONRPC_VERSION).tar.gz
-PYTHON_FLASK_JSONRPC_SITE = http://pypi.python.org/packages/source/F/Flask-JSONRPC
+PYTHON_FLASK_JSONRPC_SITE = https://pypi.python.org/packages/cb/1f/e6d66e8498609ba04bac76155b2ea884df95531e93501bf4ef009d40a83c
 PYTHON_FLASK_JSONRPC_LICENSE = BSD-3c
 PYTHON_FLASK_JSONRPC_LICENSE_FILES = setup.py
 PYTHON_FLASK_JSONRPC_SETUP_TYPE = setuptools
