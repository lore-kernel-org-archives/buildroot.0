From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 16 Jul 2021 22:59:08 +0200
Subject: [Buildroot] [git commit] package/python-pycares: bump to version
 4.0.0
Message-ID: <20210716202900.DC7AE9111A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

commit: https://git.buildroot.net/buildroot/commit/?id=79f34e1b5830e370428abc73b7c1625f1f6f64db
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pycares/python-pycares.hash | 6 +++---
 package/python-pycares/python-pycares.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-pycares/python-pycares.hash b/package/python-pycares/python-pycares.hash
index c8c46175dc..7f749938a1 100644
--- a/package/python-pycares/python-pycares.hash
+++ b/package/python-pycares/python-pycares.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pycares/json
-md5	8ac802d79b318efa27d3a9949d0604d1  pycares-3.1.1.tar.gz
-sha256	18dfd4fd300f570d6c4536c1d987b7b7673b2a9d14346592c5d6ed716df0d104  pycares-3.1.1.tar.gz
+md5  5908c5762f08d07310f081aa2d8397a2  pycares-4.0.0.tar.gz
+sha256  d0154fc5753b088758fbec9bc137e1b24bb84fc0c6a09725c8bac25a342311cd  pycares-4.0.0.tar.gz
 # Locally computed sha256 checksums
-sha256	427bb3a5372024a26e2c290b24382512bcc7ca123431c4dd178dd613beea7eee  LICENSE
+sha256  427bb3a5372024a26e2c290b24382512bcc7ca123431c4dd178dd613beea7eee  LICENSE
diff --git a/package/python-pycares/python-pycares.mk b/package/python-pycares/python-pycares.mk
index dea34f82bf..b0abb1a41a 100644
--- a/package/python-pycares/python-pycares.mk
+++ b/package/python-pycares/python-pycares.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYCARES_VERSION = 3.1.1
+PYTHON_PYCARES_VERSION = 4.0.0
 PYTHON_PYCARES_SOURCE = pycares-$(PYTHON_PYCARES_VERSION).tar.gz
-PYTHON_PYCARES_SITE = https://files.pythonhosted.org/packages/4e/09/f49ef1c4b6a5ad50fc08a8acd015f1938594dd7a6b4a6a96d049d9bbec7d
+PYTHON_PYCARES_SITE = https://files.pythonhosted.org/packages/25/5a/ed8cc3340b7e83a5e572b5d27387a968a7e52b1e3c269442076ca902b7ba
 PYTHON_PYCARES_SETUP_TYPE = setuptools
 PYTHON_PYCARES_LICENSE = MIT
 PYTHON_PYCARES_LICENSE_FILES = LICENSE
