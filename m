From: Adam Duskett <aduskett@gmail.com>
Date: Sun, 19 Feb 2017 14:12:17 -0500
Subject: [Buildroot] [PATCH 20/58] python-jinja2: bump to version 2.9.5
In-Reply-To: <20170219191255.1503-1-Adamduskett@outlook.com>
References: <20170219191255.1503-1-Adamduskett@outlook.com>
Message-ID: <20170219191255.1503-21-Adamduskett@outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
---
 package/python-jinja2/python-jinja2.hash | 4 ++--
 package/python-jinja2/python-jinja2.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-jinja2/python-jinja2.hash b/package/python-jinja2/python-jinja2.hash
index 46ea75f..f5a0972 100644
--- a/package/python-jinja2/python-jinja2.hash
+++ b/package/python-jinja2/python-jinja2.hash
@@ -1,3 +1,3 @@
 # md5 from https://pypi.python.org/pypi/jinja2/json, sha256 locally computed
-md5	b151bfab6fb728fb7a06da4299161c74  Jinja2-2.9.4.tar.gz
-sha256	aab8d8ca9f45624f1e77f2844bf3c144d180e97da8824c2a6d7552ad039b5442  Jinja2-2.9.4.tar.gz
+md5 9e55f0db6620dd99a1b366183a94270d Jinja2-2.9.5.tar.gz
+sha256 702a24d992f856fa8d5a7a36db6128198d0c21e1da34448ca236c42e92384825 Jinja2-2.9.5.tar.gz
diff --git a/package/python-jinja2/python-jinja2.mk b/package/python-jinja2/python-jinja2.mk
index 16b7b20..f5ce04c 100644
--- a/package/python-jinja2/python-jinja2.mk
+++ b/package/python-jinja2/python-jinja2.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_JINJA2_VERSION = 2.9.4
+PYTHON_JINJA2_VERSION = 2.9.5
 PYTHON_JINJA2_SOURCE = Jinja2-$(PYTHON_JINJA2_VERSION).tar.gz
-PYTHON_JINJA2_SITE = https://pypi.python.org/packages/f4/3f/28387a5bbc6883082c16784c6135440b94f9d5938fb156ff579798e18eda
+PYTHON_JINJA2_SITE = https://pypi.python.org/packages/71/59/d7423bd5e7ddaf3a1ce299ab4490e9044e8dfd195420fc83a24de9e60726
 PYTHON_JINJA2_SETUP_TYPE = setuptools
 PYTHON_JINJA2_LICENSE = BSD-3c
 PYTHON_JINJA2_LICENSE_FILES = LICENSE
-- 
2.9.3
