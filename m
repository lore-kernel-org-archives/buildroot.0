From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Mar 2017 21:54:15 +0100
Subject: [Buildroot] [git commit] python-pysmb: bump to version 1.1.19
Message-ID: <20170302205924.5E5DA7FECB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=18c90437e9834b870d3bba9db439949a130d5d06
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-pysmb/python-pysmb.hash | 6 +++---
 package/python-pysmb/python-pysmb.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-pysmb/python-pysmb.hash b/package/python-pysmb/python-pysmb.hash
index 4c41068..9524667 100644
--- a/package/python-pysmb/python-pysmb.hash
+++ b/package/python-pysmb/python-pysmb.hash
@@ -1,3 +1,3 @@
-# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=9fe70cbc812b2e789915bedea7e45b1a, sha256 locally computed
-md5     9fe70cbc812b2e789915bedea7e45b1a  pysmb-1.1.18.tar.gz
-sha256  580f7dcf8048656d2924c2f78731feaeaf6f9fa8ef5c251fc6964d39bfd3a6b9  pysmb-1.1.18.tar.gz
+# md5 from https://pypi.python.org/pypi/pysmb/json, sha256 locally computed
+md5 e6f9ce0032db528aae060f7019bd409c pysmb-1.1.19.tar.gz
+sha256 fa4e6b4a4f2afbfbd71e9179c491f8c77bc2ad19e0bc866d7c6cbfa9ae272602 pysmb-1.1.19.tar.gz
diff --git a/package/python-pysmb/python-pysmb.mk b/package/python-pysmb/python-pysmb.mk
index 51df91d..49d7c30 100644
--- a/package/python-pysmb/python-pysmb.mk
+++ b/package/python-pysmb/python-pysmb.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYSMB_VERSION = 1.1.18
+PYTHON_PYSMB_VERSION = 1.1.19
 PYTHON_PYSMB_SOURCE = pysmb-$(PYTHON_PYSMB_VERSION).tar.gz
-PYTHON_PYSMB_SITE = https://pypi.python.org/packages/source/p/pysmb
+PYTHON_PYSMB_SITE = https://pypi.python.org/packages/f9/e7/1fd7faaa946cc6b43ce85bb7a177b75a4718d9c5e291201fec00112b497c
 PYTHON_PYSMB_LICENSE = libpng license
 PYTHON_PYSMB_LICENSE_FILES = LICENSE
 PYTHON_PYSMB_SETUP_TYPE = setuptools
