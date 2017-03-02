From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Mar 2017 21:54:15 +0100
Subject: [Buildroot] [git commit] python-pycli: bump to version 2.0.3
Message-ID: <20170302205924.12DFD7FECB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c66975f3460caa21eddab520b0fd6beeebd508d6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-pycli/python-pycli.hash | 7 +++----
 package/python-pycli/python-pycli.mk   | 4 ++--
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/package/python-pycli/python-pycli.hash b/package/python-pycli/python-pycli.hash
index 8be3178..46a297e 100644
--- a/package/python-pycli/python-pycli.hash
+++ b/package/python-pycli/python-pycli.hash
@@ -1,4 +1,3 @@
-# From https://pypi.python.org/pypi?:action=show_md5&digest=5cad880168f3423a1235b396735c1360
-md5 5cad880168f3423a1235b396735c1360 pyCLI-devel.tar.gz
-# Locally calculated
-sha256 d7dc3245d79ef00ba5c0d6b008eb3d1a519c0df4cfa4467eee5160a80c6ddc0a pyCLI-devel.tar.gz
+# md5 from https://pypi.python.org/pypi/pycli/json, sha256 locally computed
+md5 89c487e7c8068ce05d63394d2ae7ebad pyCLI-2.0.3.tar.gz
+sha256 bc53e6c5db031ae1c05d131641f153d22a201c5e82cc8c9324a945752efbb622 pyCLI-2.0.3.tar.gz
diff --git a/package/python-pycli/python-pycli.mk b/package/python-pycli/python-pycli.mk
index 8e48a06..7aff1c6 100644
--- a/package/python-pycli/python-pycli.mk
+++ b/package/python-pycli/python-pycli.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYCLI_VERSION = devel
+PYTHON_PYCLI_VERSION = 2.0.3
 PYTHON_PYCLI_SOURCE = pyCLI-$(PYTHON_PYCLI_VERSION).tar.gz
-PYTHON_PYCLI_SITE = https://pypi.python.org/packages/source/p/pyCLI
+PYTHON_PYCLI_SITE = https://pypi.python.org/packages/95/fc/b2d86a5fbdac4072bcf70b01674b612e1a13026f54962c878fe3eca36fd1
 PYTHON_PYCLI_LICENSE = ISC-like
 PYTHON_PYCLI_LICENSE_FILES = lib/cli/__init__.py
 PYTHON_PYCLI_SETUP_TYPE = setuptools
