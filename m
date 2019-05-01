From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 1 May 2019 09:27:35 +0200
Subject: [Buildroot] [git commit] package/python-flask-sqlalchemy: bump to
 version 2.3.2
Message-ID: <20190501072308.2618C83D89@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7ae62516d32615072728b9be014722c203b5574d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also update hash for license file due to additional information.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-flask-sqlalchemy/python-flask-sqlalchemy.hash | 6 +++---
 package/python-flask-sqlalchemy/python-flask-sqlalchemy.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-flask-sqlalchemy/python-flask-sqlalchemy.hash b/package/python-flask-sqlalchemy/python-flask-sqlalchemy.hash
index 9e15b5d8f0..ad7f0e1a45 100644
--- a/package/python-flask-sqlalchemy/python-flask-sqlalchemy.hash
+++ b/package/python-flask-sqlalchemy/python-flask-sqlalchemy.hash
@@ -1,4 +1,4 @@
 # md5 from https://pypi.python.org/pypi/Flask-SQLAlchemy/json, sha256 locally computed
-md5    373ce61dfd03b593ad2eaba68c9fee35  Flask-SQLAlchemy-2.3.2.tar.gz
-sha256 5971b9852b5888655f11db634e87725a9031e170f37c0ce7851cf83497f56e53  Flask-SQLAlchemy-2.3.2.tar.gz
-sha256 de2011f25501c45f2b78bfa4f851ce021cfbab0f1e7ab763233688e0b969821f  PKG-INFO
+md5    01e943d6a8b492c2bc6031c024cd10be  Flask-SQLAlchemy-2.4.0.tar.gz
+sha256 0c9609b0d72871c540a7945ea559c8fdf5455192d2db67219509aed680a3d45a  Flask-SQLAlchemy-2.4.0.tar.gz
+sha256 5de187ec76e2d9dfc829fccad94ac0e5e810ddeccf8c8b50784918e4f12f14c4  PKG-INFO
diff --git a/package/python-flask-sqlalchemy/python-flask-sqlalchemy.mk b/package/python-flask-sqlalchemy/python-flask-sqlalchemy.mk
index 37fe603f1e..570fced04a 100644
--- a/package/python-flask-sqlalchemy/python-flask-sqlalchemy.mk
+++ b/package/python-flask-sqlalchemy/python-flask-sqlalchemy.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FLASK_SQLALCHEMY_VERSION = 2.3.2
+PYTHON_FLASK_SQLALCHEMY_VERSION = 2.4.0
 PYTHON_FLASK_SQLALCHEMY_SOURCE = Flask-SQLAlchemy-$(PYTHON_FLASK_SQLALCHEMY_VERSION).tar.gz
-PYTHON_FLASK_SQLALCHEMY_SITE = https://pypi.python.org/packages/3a/66/f5ace276517c075f102457dd2f7d8645b033758f9c6effb4e0970a90fec1
+PYTHON_FLASK_SQLALCHEMY_SITE = https://files.pythonhosted.org/packages/9b/62/80a56f9d223f0b89cdcf7d592455375f8c9d73866f337fa85f39f45fe0c5
 PYTHON_FLASK_SQLALCHEMY_SETUP_TYPE = setuptools
 PYTHON_FLASK_SQLALCHEMY_LICENSE = BSD-3c
 PYTHON_FLASK_SQLALCHEMY_LICENSE_FILES = PKG-INFO
