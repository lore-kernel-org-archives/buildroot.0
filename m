From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Mon, 14 Dec 2015 09:25:56 +0100
Subject: [Buildroot] [PATCH 1/2] python-pyasn: bump to 0.1.9
Message-ID: <1450081557-29241-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Add a hash file.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-pyasn/python-pyasn.hash | 3 +++
 package/python-pyasn/python-pyasn.mk   | 2 +-
 2 files changed, 4 insertions(+), 1 deletion(-)
 create mode 100644 package/python-pyasn/python-pyasn.hash

diff --git a/package/python-pyasn/python-pyasn.hash b/package/python-pyasn/python-pyasn.hash
new file mode 100644
index 0000000..59c90a8
--- /dev/null
+++ b/package/python-pyasn/python-pyasn.hash
@@ -0,0 +1,3 @@
+# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=f00a02a631d4016818659d1cc38d229a, sha256 locally computed
+md5     f00a02a631d4016818659d1cc38d229a  pyasn1-0.1.9.tar.gz
+sha256  853cacd96d1f701ddd67aa03ecc05f51890135b7262e922710112f12a2ed2a7f  pyasn1-0.1.9.tar.gz
diff --git a/package/python-pyasn/python-pyasn.mk b/package/python-pyasn/python-pyasn.mk
index fbae090..8b10958 100644
--- a/package/python-pyasn/python-pyasn.mk
+++ b/package/python-pyasn/python-pyasn.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_PYASN_VERSION = 0.1.7
+PYTHON_PYASN_VERSION = 0.1.9
 PYTHON_PYASN_SOURCE = pyasn1-$(PYTHON_PYASN_VERSION).tar.gz
 PYTHON_PYASN_SITE = https://pypi.python.org/packages/source/p/pyasn1
 PYTHON_PYASN_LICENSE = BSD-2c
-- 
2.1.4
