From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Oct 2016 23:00:40 +0200
Subject: [Buildroot] [git commit] package/python-ipy: bump version to 0.83,
	switch upstream to python.org
Message-ID: <20161005210758.5683A80F5F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9f8d9c04c1d980c1c2e1455cd48687278fd44e86
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-ipy/python-ipy.hash | 5 +++--
 package/python-ipy/python-ipy.mk   | 5 +++--
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/python-ipy/python-ipy.hash b/package/python-ipy/python-ipy.hash
index 171dbdb..ed93448 100644
--- a/package/python-ipy/python-ipy.hash
+++ b/package/python-ipy/python-ipy.hash
@@ -1,2 +1,3 @@
-# locally computed
-sha256  edaaa5344893437aa6c1eb9c4ca966eb4b8c071761793839c7b4fc2a837fbeec  python-ipy-IPy-0.82a.tar.gz
+# md5 from https://pypi.python.org/pypi/ipy/json, sha256 locally computed
+md5	7b8c6eb4111b15aea31b67108e769712  IPy-0.83.tar.gz
+sha256	61da5a532b159b387176f6eabf11946e7458b6df8fb8b91ff1d345ca7a6edab8  IPy-0.83.tar.gz
diff --git a/package/python-ipy/python-ipy.mk b/package/python-ipy/python-ipy.mk
index 6773aaf..ec0d0d7 100644
--- a/package/python-ipy/python-ipy.mk
+++ b/package/python-ipy/python-ipy.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-PYTHON_IPY_VERSION = IPy-0.82a
-PYTHON_IPY_SITE = $(call github,haypo,python-ipy,$(PYTHON_IPY_VERSION))
+PYTHON_IPY_VERSION = 0.83
+PYTHON_IPY_SOURCE = IPy-$(PYTHON_IPY_VERSION).tar.gz
+PYTHON_IPY_SITE = https://pypi.python.org/packages/88/28/79162bfc351a3f1ab44d663ab3f03fb495806fdb592170990a1568ffbf63
 PYTHON_IPY_LICENSE = BSD-3c
 PYTHON_IPY_LICENSE_FILES = COPYING
 PYTHON_IPY_SETUP_TYPE = distutils
