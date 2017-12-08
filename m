From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Fri,  8 Dec 2017 11:54:38 +0100
Subject: [Buildroot] [PATCH 3/4] python-ws4py: bump to version 0.4.2
In-Reply-To: <20171208105439.1967-1-yegorslists@googlemail.com>
References: <20171208105439.1967-1-yegorslists@googlemail.com>
Message-ID: <20171208105439.1967-3-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-ws4py/python-ws4py.hash | 4 ++--
 package/python-ws4py/python-ws4py.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-ws4py/python-ws4py.hash b/package/python-ws4py/python-ws4py.hash
index 4d5904ee0c..13469cb036 100644
--- a/package/python-ws4py/python-ws4py.hash
+++ b/package/python-ws4py/python-ws4py.hash
@@ -1,3 +1,3 @@
 # md5 from https://pypi.python.org/pypi/ws4py/json, sha256 locally computed
-md5	b0cbe30433350ef5ec98e8cbb3c3b39c  ws4py-0.3.5.tar.gz
-sha256	c4cc4a872027f6a6006a6142a38eb6d65c2ece29a4cefac98dd20a48c34ec7a9  ws4py-0.3.5.tar.gz
+md5	f0603ae376707a58d205bd87a67758a2  ws4py-0.4.2.tar.gz
+sha256	7ac69ce3e6ec6917a5d678b65f0a18e244a4dc670db6414bc0271b3f4911237f  ws4py-0.4.2.tar.gz
diff --git a/package/python-ws4py/python-ws4py.mk b/package/python-ws4py/python-ws4py.mk
index 8f3b985964..ec5b4aff35 100644
--- a/package/python-ws4py/python-ws4py.mk
+++ b/package/python-ws4py/python-ws4py.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_WS4PY_VERSION = 0.3.5
+PYTHON_WS4PY_VERSION = 0.4.2
 PYTHON_WS4PY_SOURCE = ws4py-$(PYTHON_WS4PY_VERSION).tar.gz
-PYTHON_WS4PY_SITE = https://pypi.python.org/packages/c8/b4/1784512791fbd196a48f282ca6c79398cace9541a9c151d89c30b6add6e1
+PYTHON_WS4PY_SITE = https://pypi.python.org/packages/b8/98/a90f1d96ffcb15dfc220af524ce23e0a5881258dafa197673357ce1683dd
 PYTHON_WS4PY_SETUP_TYPE = setuptools
 PYTHON_WS4PY_LICENSE = BSD-3-Clause
 PYTHON_WS4PY_LICENSE_FILES = ws4py/__init__.py
-- 
2.11.0
