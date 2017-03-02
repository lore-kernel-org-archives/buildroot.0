From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Mar 2017 21:54:15 +0100
Subject: [Buildroot] [git commit] python-ipaddress: bump to version 1.0.18
Message-ID: <20170302205923.758EA7FECB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=91c2cf9c47989a3bd8305d8b9c22752742ca7cec
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-ipaddress/python-ipaddress.hash | 4 ++--
 package/python-ipaddress/python-ipaddress.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-ipaddress/python-ipaddress.hash b/package/python-ipaddress/python-ipaddress.hash
index a7c3803..c4fdf6d 100644
--- a/package/python-ipaddress/python-ipaddress.hash
+++ b/package/python-ipaddress/python-ipaddress.hash
@@ -1,3 +1,3 @@
 # md5 from https://pypi.python.org/pypi/ipaddress/json, sha256 locally computed
-md5	8bbf0326719fafb1f453921ef96729fe  ipaddress-1.0.17.tar.gz
-sha256	3a21c5a15f433710aaa26f1ae174b615973a25182006ae7f9c26de151cd51716  ipaddress-1.0.17.tar.gz
+md5 310c2dfd64eb6f0df44aa8c59f2334a7 ipaddress-1.0.18.tar.gz
+sha256 5d8534c8e185f2d8a1fda1ef73f2c8f4b23264e8e30063feeb9511d492a413e1 ipaddress-1.0.18.tar.gz
diff --git a/package/python-ipaddress/python-ipaddress.mk b/package/python-ipaddress/python-ipaddress.mk
index 5ff70d4..10ab77a 100644
--- a/package/python-ipaddress/python-ipaddress.mk
+++ b/package/python-ipaddress/python-ipaddress.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_IPADDRESS_VERSION = 1.0.17
+PYTHON_IPADDRESS_VERSION = 1.0.18
 PYTHON_IPADDRESS_SOURCE = ipaddress-$(PYTHON_IPADDRESS_VERSION).tar.gz
-PYTHON_IPADDRESS_SITE = https://pypi.python.org/packages/bb/26/3b64955ff73f9e3155079b9ed31812afdfa5333b5c76387454d651ef593a
+PYTHON_IPADDRESS_SITE = https://pypi.python.org/packages/4e/13/774faf38b445d0b3a844b65747175b2e0500164b7c28d78e34987a5bfe06
 PYTHON_IPADDRESS_LICENSE = Python software foundation license
 PYTHON_IPADDRESS_LICENSE_FILES = LICENSE
 PYTHON_IPADDRESS_SETUP_TYPE = setuptools
