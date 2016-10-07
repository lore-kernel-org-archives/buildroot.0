From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 7 Oct 2016 14:48:35 +0200
Subject: [Buildroot] [git commit] package/python-pydal: bump version to 16.9
Message-ID: <20161007131551.7438A82262@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=09af710cb70b7414a4332d949e991cb8285d0c27
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-pydal/python-pydal.hash | 5 +++--
 package/python-pydal/python-pydal.mk   | 5 +++--
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/python-pydal/python-pydal.hash b/package/python-pydal/python-pydal.hash
index bb36617..ad17c33 100644
--- a/package/python-pydal/python-pydal.hash
+++ b/package/python-pydal/python-pydal.hash
@@ -1,2 +1,3 @@
-# locally computed
-sha256  e59c050c4b7656c36351707dfbbae187645d46327e67e42415e15b3bc32d48b3  python-pydal-v15.07.tar.gz
+# md5 from https://pypi.python.org/pypi/pydal/json, sha256 locally computed
+md5	74c6cc43d5ee57bcffa804c1204030d8  pyDAL-16.9.tar.gz
+sha256	e5e18b10df044c4328a5a2fe0400793a8f643fe3526daee8c99103fc5589476e  pyDAL-16.9.tar.gz
diff --git a/package/python-pydal/python-pydal.mk b/package/python-pydal/python-pydal.mk
index 4c5da41..a0e9729 100644
--- a/package/python-pydal/python-pydal.mk
+++ b/package/python-pydal/python-pydal.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYDAL_VERSION = v15.07
-PYTHON_PYDAL_SITE = $(call github,web2py,pydal,$(PYTHON_PYDAL_VERSION))
+PYTHON_PYDAL_VERSION = 16.9
+PYTHON_PYDAL_SOURCE = pyDAL-$(PYTHON_PYDAL_VERSION).tar.gz
+PYTHON_PYDAL_SITE = https://pypi.python.org/packages/31/cb/7537f8d848106e3e4b4063955395a5dc3177c32c2cd2cc0a1938a486d4fa
 PYTHON_PYDAL_LICENSE = BSD-3c
 PYTHON_PYDAL_LICENSE_FILES = LICENSE
 PYTHON_PYDAL_SETUP_TYPE = setuptools
