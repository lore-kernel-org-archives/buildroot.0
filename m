From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 30 Sep 2018 23:47:37 +0200
Subject: [Buildroot] [git commit] python-ipaddress: bump to version 1.0.22
Message-ID: <20180930214943.5C5E18A4F9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6b6e38371ee3fec0bfcc493e5a50812d40d93693
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also add license hash.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-ipaddress/python-ipaddress.hash | 8 +++++---
 package/python-ipaddress/python-ipaddress.mk   | 4 ++--
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/python-ipaddress/python-ipaddress.hash b/package/python-ipaddress/python-ipaddress.hash
index c4fdf6d6c0..5a3e674fa7 100644
--- a/package/python-ipaddress/python-ipaddress.hash
+++ b/package/python-ipaddress/python-ipaddress.hash
@@ -1,3 +1,5 @@
-# md5 from https://pypi.python.org/pypi/ipaddress/json, sha256 locally computed
-md5 310c2dfd64eb6f0df44aa8c59f2334a7 ipaddress-1.0.18.tar.gz
-sha256 5d8534c8e185f2d8a1fda1ef73f2c8f4b23264e8e30063feeb9511d492a413e1 ipaddress-1.0.18.tar.gz
+# md5, sha256 from https://pypi.org/pypi/ipaddress/json
+md5	74c1ce3109f30eaa1ab3dd342e7b76d4  ipaddress-1.0.22.tar.gz
+sha256	b146c751ea45cad6188dd6cf2d9b757f6f4f8d6ffb96a023e6f2e26eea02a72c  ipaddress-1.0.22.tar.gz
+# Locally computed sha256 checksums
+sha256	38675419eb4a79ec616396d70f1254b3a433fb7088fb3f4cc9b6c0bcdcec6162  LICENSE
diff --git a/package/python-ipaddress/python-ipaddress.mk b/package/python-ipaddress/python-ipaddress.mk
index 646db5d2d3..189efdfb1f 100644
--- a/package/python-ipaddress/python-ipaddress.mk
+++ b/package/python-ipaddress/python-ipaddress.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_IPADDRESS_VERSION = 1.0.18
+PYTHON_IPADDRESS_VERSION = 1.0.22
 PYTHON_IPADDRESS_SOURCE = ipaddress-$(PYTHON_IPADDRESS_VERSION).tar.gz
-PYTHON_IPADDRESS_SITE = https://pypi.python.org/packages/4e/13/774faf38b445d0b3a844b65747175b2e0500164b7c28d78e34987a5bfe06
+PYTHON_IPADDRESS_SITE = https://files.pythonhosted.org/packages/97/8d/77b8cedcfbf93676148518036c6b1ce7f8e14bf07e95d7fd4ddcb8cc052f
 PYTHON_IPADDRESS_LICENSE = Python-2.0
 PYTHON_IPADDRESS_LICENSE_FILES = LICENSE
 PYTHON_IPADDRESS_SETUP_TYPE = setuptools
