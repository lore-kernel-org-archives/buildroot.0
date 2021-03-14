From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 14 Mar 2021 18:09:54 +0100
Subject: [Buildroot] [git commit] package/python-flask-babel: bump version
 to 2.0.0
Message-ID: <20210314164744.5254F83D1F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1840adf012a3eb4e382606572e773a0086be7411
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-flask-babel/python-flask-babel.hash | 6 +++---
 package/python-flask-babel/python-flask-babel.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-flask-babel/python-flask-babel.hash b/package/python-flask-babel/python-flask-babel.hash
index 288036eea8..46a019c98b 100644
--- a/package/python-flask-babel/python-flask-babel.hash
+++ b/package/python-flask-babel/python-flask-babel.hash
@@ -1,6 +1,6 @@
-# From: https://pypi.org/project/Flask-Babel/#copy-hash-modal-91caaca6-a716-4751-9ec0-08baadced4b1
-md5  162ccb275958f9a463211ece841a2b9a  Flask-Babel-1.0.0.tar.gz
-sha256	d6a70468f9a8919d59fba2a291a003da3a05ff884275dddbd965f3b98b09ab3e  Flask-Babel-1.0.0.tar.gz
+# From: https://pypi.org/project/Flask-Babel/#copy-hash-modal-80f92a70-1c66-4cce-bb3d-8d6f98287e3f
+md5  50d5e92d96ef58787bf85b5a1b0a5567  Flask-Babel-2.0.0.tar.gz
+sha256	f9faf45cdb2e1a32ea2ec14403587d4295108f35017a7821a2b1acb8cfd9257d  Flask-Babel-2.0.0.tar.gz
 
 # License files
 sha256	a526100a7047237360a394ba4f70ae801b50ff9b8c9b9e73e7795480a59f6b7e  LICENSE
diff --git a/package/python-flask-babel/python-flask-babel.mk b/package/python-flask-babel/python-flask-babel.mk
index cd14658952..35241e78db 100644
--- a/package/python-flask-babel/python-flask-babel.mk
+++ b/package/python-flask-babel/python-flask-babel.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FLASK_BABEL_VERSION = 1.0.0
+PYTHON_FLASK_BABEL_VERSION = 2.0.0
 PYTHON_FLASK_BABEL_SOURCE = Flask-Babel-$(PYTHON_FLASK_BABEL_VERSION).tar.gz
-PYTHON_FLASK_BABEL_SITE = https://files.pythonhosted.org/packages/7a/73/e4a9532ca11daeead1a99251f2ec1a5faf98117b83dbfe1b30535004cd98
+PYTHON_FLASK_BABEL_SITE = https://files.pythonhosted.org/packages/d7/fe/655e6a5a99ceb815fe839f0698956a9d6c7d5bcc06ca1ee7c6eb6dac154b
 PYTHON_FLASK_BABEL_LICENSE = BSD-3-Clause
 PYTHON_FLASK_BABEL_SETUP_TYPE = setuptools
 PYTHON_FLASK_BABEL_LICENSE_FILES = LICENSE
