From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Mar 2017 21:54:15 +0100
Subject: [Buildroot] [git commit] python-ipython: bump to version 5.2.2
Message-ID: <20170302205923.872D37FBE1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5fa786e328fa883ef053739107d217022f7bd8a6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-ipython/python-ipython.hash | 5 +++--
 package/python-ipython/python-ipython.mk   | 4 ++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/python-ipython/python-ipython.hash b/package/python-ipython/python-ipython.hash
index 250a022..a223408 100644
--- a/package/python-ipython/python-ipython.hash
+++ b/package/python-ipython/python-ipython.hash
@@ -1,2 +1,3 @@
-# locally computed
-sha256  ca86a6308c4b53ea8a040ba776066dc9a7af4ac738ad43ab2059a016c09b0c2d  ipython-2.1.0.tar.gz
+# md5 from https://pypi.python.org/pypi/ipython/json, sha256 locally computed
+md5 19e4a46ec7d7a32d068de4c253c9b459 ipython-5.2.2.tar.gz
+sha256 6ee1c89f6031e0c86727820ad394c6eb4d3ac28de48e0df3b9367ccf92e212e2 ipython-5.2.2.tar.gz
diff --git a/package/python-ipython/python-ipython.mk b/package/python-ipython/python-ipython.mk
index 236462a..07b682b 100644
--- a/package/python-ipython/python-ipython.mk
+++ b/package/python-ipython/python-ipython.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_IPYTHON_VERSION = 2.1.0
+PYTHON_IPYTHON_VERSION = 5.2.2
 PYTHON_IPYTHON_SOURCE = ipython-$(PYTHON_IPYTHON_VERSION).tar.gz
-PYTHON_IPYTHON_SITE = https://pypi.python.org/packages/source/i/ipython
+PYTHON_IPYTHON_SITE = https://pypi.python.org/packages/6e/cf/c2a3ca5942e2d8084574157a8f818efafb7218204cd9e41166c92c452e07
 PYTHON_IPYTHON_LICENSE = BSD-3c
 PYTHON_IPYTHON_LICENSE_FILES = COPYING.rst
 PYTHON_IPYTHON_SETUP_TYPE = distutils
