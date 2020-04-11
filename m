From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 11 Apr 2020 10:25:35 +0200
Subject: [Buildroot] [git commit] package/python-flask-babel: bump version
 to 1.0.0
Message-ID: <20200411081600.9B4768E4BB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=74878dec781c57c76f41b6b5b0bfe9b07f0b6a38
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-flask-babel/python-flask-babel.hash | 9 +++++----
 package/python-flask-babel/python-flask-babel.mk   | 4 ++--
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/package/python-flask-babel/python-flask-babel.hash b/package/python-flask-babel/python-flask-babel.hash
index e059a594d5..288036eea8 100644
--- a/package/python-flask-babel/python-flask-babel.hash
+++ b/package/python-flask-babel/python-flask-babel.hash
@@ -1,5 +1,6 @@
-# md5, sha256 from https://pypi.org/pypi/flask-babel/json
-md5	fcf2f360ff279d3133e40974804efd72  Flask-Babel-0.12.2.tar.gz
-sha256	316ad183e42003f3922957fa643d0a1e8e34a0f0301a88c3a8f605bc37ba5c86  Flask-Babel-0.12.2.tar.gz
-# Locally computed sha256 checksums
+# From: https://pypi.org/project/Flask-Babel/#copy-hash-modal-91caaca6-a716-4751-9ec0-08baadced4b1
+md5  162ccb275958f9a463211ece841a2b9a  Flask-Babel-1.0.0.tar.gz
+sha256	d6a70468f9a8919d59fba2a291a003da3a05ff884275dddbd965f3b98b09ab3e  Flask-Babel-1.0.0.tar.gz
+
+# License files
 sha256	a526100a7047237360a394ba4f70ae801b50ff9b8c9b9e73e7795480a59f6b7e  LICENSE
diff --git a/package/python-flask-babel/python-flask-babel.mk b/package/python-flask-babel/python-flask-babel.mk
index 978d29943b..cd14658952 100644
--- a/package/python-flask-babel/python-flask-babel.mk
+++ b/package/python-flask-babel/python-flask-babel.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FLASK_BABEL_VERSION = 0.12.2
+PYTHON_FLASK_BABEL_VERSION = 1.0.0
 PYTHON_FLASK_BABEL_SOURCE = Flask-Babel-$(PYTHON_FLASK_BABEL_VERSION).tar.gz
-PYTHON_FLASK_BABEL_SITE = https://files.pythonhosted.org/packages/82/b0/986b29938d4e8be7deb552ebfd1ef16c311276a59bcae10dec567a5b3d20
+PYTHON_FLASK_BABEL_SITE = https://files.pythonhosted.org/packages/7a/73/e4a9532ca11daeead1a99251f2ec1a5faf98117b83dbfe1b30535004cd98
 PYTHON_FLASK_BABEL_LICENSE = BSD-3-Clause
 PYTHON_FLASK_BABEL_SETUP_TYPE = setuptools
 PYTHON_FLASK_BABEL_LICENSE_FILES = LICENSE
