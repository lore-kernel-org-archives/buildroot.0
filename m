From: Adam Duskett <aduskett@gmail.com>
Date: Sun, 19 Feb 2017 14:12:14 -0500
Subject: [Buildroot] [PATCH 17/58] python-idna: bump to version 2.2
In-Reply-To: <20170219191255.1503-1-Adamduskett@outlook.com>
References: <20170219191255.1503-1-Adamduskett@outlook.com>
Message-ID: <20170219191255.1503-18-Adamduskett@outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
---
 package/python-idna/python-idna.hash | 6 +++---
 package/python-idna/python-idna.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-idna/python-idna.hash b/package/python-idna/python-idna.hash
index 4e4c677..e3c2ab4 100644
--- a/package/python-idna/python-idna.hash
+++ b/package/python-idna/python-idna.hash
@@ -1,3 +1,3 @@
-# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=f6473caa9c5e0cc1ad3fd5d04c3c114b, sha256 locally computed
-md5     f6473caa9c5e0cc1ad3fd5d04c3c114b  idna-2.1.tar.gz
-sha256  ed36f281aebf3cd0797f163bb165d84c31507cedd15928b095b1675e2d04c676  idna-2.1.tar.gz
+# md5 from https://pypi.python.org/pypi/idna/json, sha256 locally computed
+md5 e2d3f8a45d3d048a653eb186896e9e3e idna-2.2.tar.gz
+sha256 0ac27740937d86850010e035c6a10a564158a5accddf1aa24df89b0309252426 idna-2.2.tar.gz
diff --git a/package/python-idna/python-idna.mk b/package/python-idna/python-idna.mk
index 3f9f109..bb87f47 100644
--- a/package/python-idna/python-idna.mk
+++ b/package/python-idna/python-idna.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_IDNA_VERSION = 2.1
+PYTHON_IDNA_VERSION = 2.2
 PYTHON_IDNA_SOURCE = idna-$(PYTHON_IDNA_VERSION).tar.gz
-PYTHON_IDNA_SITE = https://pypi.python.org/packages/source/i/idna
+PYTHON_IDNA_SITE = https://pypi.python.org/packages/94/fe/efb1cb6f505e1a560b3d080ae6b9fddc11e7c542d694ce4635c49b1ccdcb
 PYTHON_IDNA_LICENSE =  BSD-3c
 PYTHON_IDNA_LICENSE_FILES = LICENSE.rst
 PYTHON_IDNA_SETUP_TYPE = setuptools
-- 
2.9.3
