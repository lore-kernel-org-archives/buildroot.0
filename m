From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 18 Oct 2019 20:57:30 +0200
Subject: [Buildroot] [git commit] package/python-pyasn1-modules: bump to
 version 0.2.7
Message-ID: <20191018191755.5F0D9826E8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=25eea92d3c7fda9a27433d8d4dcbc3b34ad91227
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-pyasn1-modules/python-pyasn1-modules.hash | 4 ++--
 package/python-pyasn1-modules/python-pyasn1-modules.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pyasn1-modules/python-pyasn1-modules.hash b/package/python-pyasn1-modules/python-pyasn1-modules.hash
index f8af9a4bb8..96831dc5dc 100644
--- a/package/python-pyasn1-modules/python-pyasn1-modules.hash
+++ b/package/python-pyasn1-modules/python-pyasn1-modules.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pyasn1-modules/json
-md5	0116a480c28e1ab00587ba3a6fd7c335  pyasn1-modules-0.2.4.tar.gz
-sha256	a52090e8c5841ebbf08ae455146792d9ef3e8445b21055d3a3b7ed9c712b7c7c  pyasn1-modules-0.2.4.tar.gz
+md5	18c77d56abeef631d94f95ff2d652859  pyasn1-modules-0.2.7.tar.gz
+sha256	0c35a52e00b672f832e5846826f1fb7507907f7d52fba6faa9e3c4cbe874fe4b  pyasn1-modules-0.2.7.tar.gz
 # Locally computed sha256 checksums
 sha256	22c5cc6922ab5d69fba32d8c5ee4cdd14981508cb53afc0ebd85593847fd95a5  LICENSE.txt
diff --git a/package/python-pyasn1-modules/python-pyasn1-modules.mk b/package/python-pyasn1-modules/python-pyasn1-modules.mk
index a67d469568..afc3c363fd 100644
--- a/package/python-pyasn1-modules/python-pyasn1-modules.mk
+++ b/package/python-pyasn1-modules/python-pyasn1-modules.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYASN1_MODULES_VERSION = 0.2.4
+PYTHON_PYASN1_MODULES_VERSION = 0.2.7
 PYTHON_PYASN1_MODULES_SOURCE = pyasn1-modules-$(PYTHON_PYASN1_MODULES_VERSION).tar.gz
-PYTHON_PYASN1_MODULES_SITE = https://files.pythonhosted.org/packages/bd/a5/ef7bf693e8a8f015386c9167483199f54f8a8ec01d1c737e05524f16e792
+PYTHON_PYASN1_MODULES_SITE = https://files.pythonhosted.org/packages/75/93/c51104ea6a74252957c341ccd110b65efecc18edfd386b666637d67d4d10
 PYTHON_PYASN1_MODULES_SETUP_TYPE = setuptools
 PYTHON_PYASN1_MODULES_LICENSE = BSD-2-Clause
 PYTHON_PYASN1_MODULES_LICENSE_FILES = LICENSE.txt
