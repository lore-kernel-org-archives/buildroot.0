From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 10 Apr 2021 10:28:57 +0200
Subject: [Buildroot] [git commit] package/python-pyelftools: bump to version
 0.27
Message-ID: <20210410080609.C084681185@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f90056070b9643d5e9a1626ed3592748a2c6a1f7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update indentation in hash file (two spaces)

https://github.com/eliben/pyelftools/blob/v0.27/CHANGES

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-pyelftools/python-pyelftools.hash | 6 +++---
 package/python-pyelftools/python-pyelftools.mk   | 4 ++--
 package/python3-pyelftools/python3-pyelftools.mk | 4 ++--
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/python-pyelftools/python-pyelftools.hash b/package/python-pyelftools/python-pyelftools.hash
index 80900b711d..a309b90e15 100644
--- a/package/python-pyelftools/python-pyelftools.hash
+++ b/package/python-pyelftools/python-pyelftools.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pyelftools/json
-md5	c5629b9a5d19c82107a946cce52eeec2  pyelftools-0.25.tar.gz
-sha256	89c6da6f56280c37a5ff33468591ba9a124e17d71fe42de971818cbff46c1b24  pyelftools-0.25.tar.gz
+md5  061d67c669a9b1f8d07f28c47fb6a65f  pyelftools-0.27.tar.gz
+sha256  cde854e662774c5457d688ca41615f6594187ba7067af101232df889a6b7a66b  pyelftools-0.27.tar.gz
 # Locally computed sha256 checksums
-sha256	ae18bf4cb82f92af7547259177bc28bc48e4fc732518bcedfe690226288d3445  LICENSE
+sha256  ae18bf4cb82f92af7547259177bc28bc48e4fc732518bcedfe690226288d3445  LICENSE
diff --git a/package/python-pyelftools/python-pyelftools.mk b/package/python-pyelftools/python-pyelftools.mk
index 71ad49f20c..3ae0a4ffc2 100644
--- a/package/python-pyelftools/python-pyelftools.mk
+++ b/package/python-pyelftools/python-pyelftools.mk
@@ -5,9 +5,9 @@
 ################################################################################
 
 # Please keep in sync with package/python3-pyelftools/python3-pyelftools.mk
-PYTHON_PYELFTOOLS_VERSION = 0.25
+PYTHON_PYELFTOOLS_VERSION = 0.27
 PYTHON_PYELFTOOLS_SOURCE = pyelftools-$(PYTHON_PYELFTOOLS_VERSION).tar.gz
-PYTHON_PYELFTOOLS_SITE = https://files.pythonhosted.org/packages/fa/9a/0674cb1725196568bdbca98304f2efb17368b57af1a4bb3fc772c026f474
+PYTHON_PYELFTOOLS_SITE = https://files.pythonhosted.org/packages/6b/b5/f7022f2d950327ba970ec85fb8f85c79244031092c129b6f34ab17514ae0
 PYTHON_PYELFTOOLS_LICENSE = Public domain
 PYTHON_PYELFTOOLS_LICENSE_FILES = LICENSE
 PYTHON_PYELFTOOLS_SETUP_TYPE = setuptools
diff --git a/package/python3-pyelftools/python3-pyelftools.mk b/package/python3-pyelftools/python3-pyelftools.mk
index be49ca2bcf..3d21d3040e 100644
--- a/package/python3-pyelftools/python3-pyelftools.mk
+++ b/package/python3-pyelftools/python3-pyelftools.mk
@@ -5,9 +5,9 @@
 ################################################################################
 
 # Please keep in sync with package/python-pyelftools/python-pyelftools.mk
-PYTHON3_PYELFTOOLS_VERSION = 0.25
+PYTHON3_PYELFTOOLS_VERSION = 0.27
 PYTHON3_PYELFTOOLS_SOURCE = pyelftools-$(PYTHON3_PYELFTOOLS_VERSION).tar.gz
-PYTHON3_PYELFTOOLS_SITE = https://files.pythonhosted.org/packages/fa/9a/0674cb1725196568bdbca98304f2efb17368b57af1a4bb3fc772c026f474
+PYTHON3_PYELFTOOLS_SITE = https://files.pythonhosted.org/packages/6b/b5/f7022f2d950327ba970ec85fb8f85c79244031092c129b6f34ab17514ae0
 PYTHON3_PYELFTOOLS_LICENSE = Public domain
 PYTHON3_PYELFTOOLS_LICENSE_FILES = LICENSE
 PYTHON3_PYELFTOOLS_SETUP_TYPE = setuptools
