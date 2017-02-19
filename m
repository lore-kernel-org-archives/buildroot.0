From: Adam Duskett <aduskett@gmail.com>
Date: Sun, 19 Feb 2017 14:12:48 -0500
Subject: [Buildroot] [PATCH 51/58] python-simplejson: bump to version 3.10.0
In-Reply-To: <20170219191255.1503-1-Adamduskett@outlook.com>
References: <20170219191255.1503-1-Adamduskett@outlook.com>
Message-ID: <20170219191255.1503-52-Adamduskett@outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
---
 package/python-simplejson/python-simplejson.hash | 4 ++--
 package/python-simplejson/python-simplejson.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-simplejson/python-simplejson.hash b/package/python-simplejson/python-simplejson.hash
index 19421b8..0f7147c 100644
--- a/package/python-simplejson/python-simplejson.hash
+++ b/package/python-simplejson/python-simplejson.hash
@@ -1,3 +1,3 @@
 # md5 from https://pypi.python.org/pypi/simplejson/json, sha256 locally computed
-md5	53b1371bbf883b129a12d594a97e9a18  simplejson-3.8.2.tar.gz
-sha256	d58439c548433adcda98e695be53e526ba940a4b9c44fb9a05d92cd495cdd47f  simplejson-3.8.2.tar.gz
+md5 426a9631d22851a7a970b1a677368b15 simplejson-3.10.0.tar.gz
+sha256 953be622e88323c6f43fad61ffd05bebe73b9fd9863a46d68b052d2aa7d71ce2 simplejson-3.10.0.tar.gz
diff --git a/package/python-simplejson/python-simplejson.mk b/package/python-simplejson/python-simplejson.mk
index 703bca2..3bf2dda 100644
--- a/package/python-simplejson/python-simplejson.mk
+++ b/package/python-simplejson/python-simplejson.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SIMPLEJSON_VERSION = 3.8.2
+PYTHON_SIMPLEJSON_VERSION = 3.10.0
 PYTHON_SIMPLEJSON_SOURCE = simplejson-$(PYTHON_SIMPLEJSON_VERSION).tar.gz
-PYTHON_SIMPLEJSON_SITE = https://pypi.python.org/packages/f0/07/26b519e6ebb03c2a74989f7571e6ae6b82e9d7d81b8de6fcdbfc643c7b58
+PYTHON_SIMPLEJSON_SITE = https://pypi.python.org/packages/40/ad/52c1f3a562df3b210e8f165e1aa243a178c454ead65476a39fa3ce1847b6
 PYTHON_SIMPLEJSON_LICENSE = Academic Free License (AFL), MIT
 PYTHON_SIMPLEJSON_LICENSE_FILES = LICENSE.txt
 PYTHON_SIMPLEJSON_SETUP_TYPE = setuptools
-- 
2.9.3
