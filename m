From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 7 Oct 2016 15:15:20 +0200
Subject: [Buildroot] [git commit] package/python-ws4py: bump version to 0.3.5
Message-ID: <20161007131552.48EF0822E2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=13afb2ab42b328a075038a5e387034e86bb8b2ee
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-ws4py/python-ws4py.hash | 6 +++---
 package/python-ws4py/python-ws4py.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-ws4py/python-ws4py.hash b/package/python-ws4py/python-ws4py.hash
index e58e14a..4d5904e 100644
--- a/package/python-ws4py/python-ws4py.hash
+++ b/package/python-ws4py/python-ws4py.hash
@@ -1,3 +1,3 @@
-# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=6b47e33cbd13f5c134b04f2a44a480ad, sha256 locally computed
-md5     6b47e33cbd13f5c134b04f2a44a480ad  ws4py-0.3.4.tar.gz
-sha256  85d5c01bb0d031e151a32fad56094caf54e20c2ddb51cf25b5709421ff92d007  ws4py-0.3.4.tar.gz
+# md5 from https://pypi.python.org/pypi/ws4py/json, sha256 locally computed
+md5	b0cbe30433350ef5ec98e8cbb3c3b39c  ws4py-0.3.5.tar.gz
+sha256	c4cc4a872027f6a6006a6142a38eb6d65c2ece29a4cefac98dd20a48c34ec7a9  ws4py-0.3.5.tar.gz
diff --git a/package/python-ws4py/python-ws4py.mk b/package/python-ws4py/python-ws4py.mk
index f332d15..fac99f3 100644
--- a/package/python-ws4py/python-ws4py.mk
+++ b/package/python-ws4py/python-ws4py.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_WS4PY_VERSION = 0.3.4
+PYTHON_WS4PY_VERSION = 0.3.5
 PYTHON_WS4PY_SOURCE = ws4py-$(PYTHON_WS4PY_VERSION).tar.gz
-PYTHON_WS4PY_SITE = https://pypi.python.org/packages/source/w/ws4py
+PYTHON_WS4PY_SITE = https://pypi.python.org/packages/c8/b4/1784512791fbd196a48f282ca6c79398cace9541a9c151d89c30b6add6e1
 PYTHON_WS4PY_SETUP_TYPE = setuptools
 PYTHON_WS4PY_LICENSE = BSD-3c
 PYTHON_WS4PY_LICENSE_FILES = ws4py/__init__.py
