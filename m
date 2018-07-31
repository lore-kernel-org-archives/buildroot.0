From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 31 Jul 2018 21:52:05 +0200
Subject: [Buildroot] [git commit] package/python-mwclient: bump version to
 0.9.1
Message-ID: <20180731194702.0E98B8A5A9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9e322d49981efe80481515b338378e74388213c7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Updated package using scanpypi.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-mwclient/python-mwclient.hash | 7 ++++---
 package/python-mwclient/python-mwclient.mk   | 4 ++--
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/python-mwclient/python-mwclient.hash b/package/python-mwclient/python-mwclient.hash
index 3fb643e601..a20950a249 100644
--- a/package/python-mwclient/python-mwclient.hash
+++ b/package/python-mwclient/python-mwclient.hash
@@ -1,4 +1,5 @@
-# md5 from https://pypi.python.org/pypi/mwclient/json, sha256 locally computed
-md5	486d3109e73d298d512d967501b23647  mwclient-0.8.7.tar.gz
-sha256	3bdaaa48fda6386b190651e49484a549bd0c48b97573dbda34a8b7c4c80430ed  mwclient-0.8.7.tar.gz
+# md5, sha256 from https://pypi.org/pypi/mwclient/json
+md5	b9fc00d68dbf4a3db4ca476d438d6b57  mwclient-0.9.1.tar.gz
+sha256	ed7a0eeb98f0309946ae8762b60eae10eb507e4b67400931ec24abd0aee3d7b4  mwclient-0.9.1.tar.gz
+# Locally computed
 sha256	d29eaa80939b6d8fc3ab458bab90f4af879fa9e0430ed7e0fb2b94752e7eb33f  mwclient/__init__.py
diff --git a/package/python-mwclient/python-mwclient.mk b/package/python-mwclient/python-mwclient.mk
index 5f18ef7d1b..7edf05add1 100644
--- a/package/python-mwclient/python-mwclient.mk
+++ b/package/python-mwclient/python-mwclient.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MWCLIENT_VERSION = 0.8.7
+PYTHON_MWCLIENT_VERSION = 0.9.1
 PYTHON_MWCLIENT_SOURCE = mwclient-$(PYTHON_MWCLIENT_VERSION).tar.gz
-PYTHON_MWCLIENT_SITE = https://pypi.python.org/packages/63/05/ddf7d1b0d3a1dc9ee650dcaef7ddfbb980b4d2f0c41128c5f9e6fed5e8e2
+PYTHON_MWCLIENT_SITE = https://files.pythonhosted.org/packages/1b/9b/c790760100c336e596b99ad13537fda36c13ea6f289b88594e9ad0d90a1e
 PYTHON_MWCLIENT_LICENSE = MIT
 PYTHON_MWCLIENT_LICENSE_FILES = mwclient/__init__.py
 PYTHON_MWCLIENT_SETUP_TYPE = setuptools
