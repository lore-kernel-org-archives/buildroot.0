From: Asaf Kahlon <asafka7@gmail.com>
Date: Fri, 18 Oct 2019 21:26:25 +0300
Subject: [Buildroot] [PATCH 1/1] package/python-urwid: bump to version 2.0.1
In-Reply-To: <20191018182628.15545-1-asafka7@gmail.com>
References: <20191018182628.15545-1-asafka7@gmail.com>
Message-ID: <20191018182628.15545-28-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also add hash for license file.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-urwid/python-urwid.hash | 8 +++++---
 package/python-urwid/python-urwid.mk   | 4 ++--
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/python-urwid/python-urwid.hash b/package/python-urwid/python-urwid.hash
index c600851646..51a6e12ea1 100644
--- a/package/python-urwid/python-urwid.hash
+++ b/package/python-urwid/python-urwid.hash
@@ -1,3 +1,5 @@
-# md5 from https://pypi.python.org/pypi/urwid/json, sha256 locally computed
-md5	2e1a005cb31368fe21bfeba2d6ad5a5c  urwid-1.3.1.tar.gz
-sha256	cfcec03e36de25a1073e2e35c2c7b0cc6969b85745715c3a025a31d9786896a1  urwid-1.3.1.tar.gz
+# md5, sha256 from https://pypi.org/pypi/urwid/json
+md5	c70a7016fa1ad2c2a979dbebd4de78c2  urwid-2.0.1.tar.gz
+sha256	644d3e3900867161a2fc9287a9762753d66bd194754679adb26aede559bcccbc  urwid-2.0.1.tar.gz
+# Locally computed sha256
+sha256	36b6d3fa47916943fd5fec313c584784946047ec1337a78b440e5992cb595f89  COPYING
diff --git a/package/python-urwid/python-urwid.mk b/package/python-urwid/python-urwid.mk
index 4cfee477e3..f8a370234c 100644
--- a/package/python-urwid/python-urwid.mk
+++ b/package/python-urwid/python-urwid.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_URWID_VERSION = 1.3.1
+PYTHON_URWID_VERSION = 2.0.1
 PYTHON_URWID_SOURCE = urwid-$(PYTHON_URWID_VERSION).tar.gz
-PYTHON_URWID_SITE = https://pypi.python.org/packages/source/u/urwid
+PYTHON_URWID_SITE = https://files.pythonhosted.org/packages/c7/90/415728875c230fafd13d118512bde3184d810d7bf798a631abc05fac09d0
 PYTHON_URWID_LICENSE = LGPL-2.1+
 PYTHON_URWID_LICENSE_FILES = COPYING
 PYTHON_URWID_SETUP_TYPE = setuptools
-- 
2.20.1
