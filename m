From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 21 Jul 2017 23:04:50 +0200
Subject: [Buildroot] [git commit] python-flask: bump to version 0.12.2
Message-ID: <20170721210346.C906B80169@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c0f01e77fe16f4fbf1913556669274b29b72aceb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-flask/python-flask.hash | 6 +++---
 package/python-flask/python-flask.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-flask/python-flask.hash b/package/python-flask/python-flask.hash
index 919b075..ca11721 100644
--- a/package/python-flask/python-flask.hash
+++ b/package/python-flask/python-flask.hash
@@ -1,3 +1,3 @@
-# md5 from https://pypi.python.org/pypi/flask/json, sha256 locally computed
-md5	c1d30f51cff4a38f9454b23328a15c5a  Flask-0.12.tar.gz
-sha256	93e803cdbe326a61ebd5c5d353959397c85f829bec610d59cb635c9f97d7ca8b  Flask-0.12.tar.gz
+# md5 from https://pypi.python.org/pypi/Flask/json, sha256 locally computed
+md5	97278dfdafda98ba7902e890b0289177  Flask-0.12.2.tar.gz
+sha256	49f44461237b69ecd901cc7ce66feea0319b9158743dd27a2899962ab214dac1  Flask-0.12.2.tar.gz
diff --git a/package/python-flask/python-flask.mk b/package/python-flask/python-flask.mk
index 856fa06..06b1b4d 100644
--- a/package/python-flask/python-flask.mk
+++ b/package/python-flask/python-flask.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FLASK_VERSION = 0.12
+PYTHON_FLASK_VERSION = 0.12.2
 PYTHON_FLASK_SOURCE = Flask-$(PYTHON_FLASK_VERSION).tar.gz
-PYTHON_FLASK_SITE = https://pypi.python.org/packages/4b/3a/4c20183df155dd2e39168e35d53a388efb384a512ca6c73001d8292c094a
+PYTHON_FLASK_SITE = https://pypi.python.org/packages/eb/12/1c7bd06fcbd08ba544f25bf2c6612e305a70ea51ca0eda8007344ec3f123
 PYTHON_FLASK_SETUP_TYPE = setuptools
 PYTHON_FLASK_LICENSE = BSD-3-Clause
 PYTHON_FLASK_LICENSE_FILES = LICENSE
