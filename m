From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Mar 2017 21:54:15 +0100
Subject: [Buildroot] [git commit] python-cherrypy: bump to version 10.1.1
Message-ID: <20170302205923.00039822D1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=98c0bb2324ab8a2eb2bacaa497f11f773af771cd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-cherrypy/python-cherrypy.hash | 6 +++---
 package/python-cherrypy/python-cherrypy.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-cherrypy/python-cherrypy.hash b/package/python-cherrypy/python-cherrypy.hash
index 6befa45..64d556d 100644
--- a/package/python-cherrypy/python-cherrypy.hash
+++ b/package/python-cherrypy/python-cherrypy.hash
@@ -1,3 +1,3 @@
-# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=4b765329b0b4b65ec25811e3febb6c93, sha256 locally computed
-md5	4b765329b0b4b65ec25811e3febb6c93  CherryPy-4.0.0.tar.gz
-sha256	73ad4f8870b5a3e9988a7778b5d3003a390d440527ec3458a0c7e58865d2611a  CherryPy-4.0.0.tar.gz
+# md5 from https://pypi.python.org/pypi/cherrypy/json, sha256 locally computed
+md5 4957d9f40c7a0772ad4f2e3fbb5a627f CherryPy-10.1.1.tar.gz
+sha256 a78a604e3afb0074cafa9c15c4ca25af0db4e52b2931e4a2c4b7df09151aa032 CherryPy-10.1.1.tar.gz
diff --git a/package/python-cherrypy/python-cherrypy.mk b/package/python-cherrypy/python-cherrypy.mk
index 754e0a2..ef19b54 100644
--- a/package/python-cherrypy/python-cherrypy.mk
+++ b/package/python-cherrypy/python-cherrypy.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CHERRYPY_VERSION = 4.0.0
+PYTHON_CHERRYPY_VERSION = 10.1.1
 PYTHON_CHERRYPY_SOURCE = CherryPy-$(PYTHON_CHERRYPY_VERSION).tar.gz
-PYTHON_CHERRYPY_SITE = http://pypi.python.org/packages/source/C/CherryPy
+PYTHON_CHERRYPY_SITE = https://pypi.python.org/packages/da/e2/6ed242ebfe96912e0866cc01139027d342d52c35ad33ee182bfb671c177d
 PYTHON_CHERRYPY_LICENSE = BSD-3c
 PYTHON_CHERRYPY_LICENSE_FILES = cherrypy/LICENSE.txt
 PYTHON_CHERRYPY_SETUP_TYPE = distutils
