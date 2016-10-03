From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon,  3 Oct 2016 23:11:31 +0200
Subject: [Buildroot] [PATCH 11/28] package/python-flask: bump version to
	0.11.1
In-Reply-To: <20161003211148.18603-1-bernd.kuhls@t-online.de>
References: <20161003211148.18603-1-bernd.kuhls@t-online.de>
Message-ID: <20161003211148.18603-11-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/python-flask/python-flask.hash | 6 +++---
 package/python-flask/python-flask.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-flask/python-flask.hash b/package/python-flask/python-flask.hash
index 1432c55..01ccc6e 100644
--- a/package/python-flask/python-flask.hash
+++ b/package/python-flask/python-flask.hash
@@ -1,3 +1,3 @@
-# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=89fbdcb04b7b96c5b24625ae299cf48b, sha256 locally computed
-md5	89fbdcb04b7b96c5b24625ae299cf48b  Flask-0.11.tar.gz
-sha256	29a7405a7f0de178232fe48cd9b2a2403083bf03bd34eabe12168863d4cdb493  Flask-0.11.tar.gz
+# md5 from https://pypi.python.org/pypi/flask/json, sha256 locally computed
+md5	d2af95d8fe79cf7da099f062dd122a08  Flask-0.11.1.tar.gz
+sha256	b4713f2bfb9ebc2966b8a49903ae0d3984781d5c878591cf2f7b484d28756b0e  Flask-0.11.1.tar.gz
diff --git a/package/python-flask/python-flask.mk b/package/python-flask/python-flask.mk
index db4ba74..204eba0 100644
--- a/package/python-flask/python-flask.mk
+++ b/package/python-flask/python-flask.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FLASK_VERSION = 0.11
+PYTHON_FLASK_VERSION = 0.11.1
 PYTHON_FLASK_SOURCE = Flask-$(PYTHON_FLASK_VERSION).tar.gz
-PYTHON_FLASK_SITE = https://pypi.python.org/packages/dc/ca/c0ed9cc90c079085c698e284b672edbc1ffd6866b1830574095cbc5b7752
+PYTHON_FLASK_SITE = https://pypi.python.org/packages/55/8a/78e165d30f0c8bb5d57c429a30ee5749825ed461ad6c959688872643ffb3
 PYTHON_FLASK_SETUP_TYPE = setuptools
 PYTHON_FLASK_LICENSE = BSD-3c
 PYTHON_FLASK_LICENSE_FILES = LICENSE
-- 
2.9.3
