From: Andrey Smirnov <andrew.smirnov@gmail.com>
Date: Fri,  2 Jun 2017 16:56:53 -0700
Subject: [Buildroot] [PATCH v3 11/11] python-ipython: bump to version 5.4.0
In-Reply-To: <20170602235653.4655-1-andrew.smirnov@gmail.com>
References: <20170602235653.4655-1-andrew.smirnov@gmail.com>
Message-ID: <20170602235653.4655-12-andrew.smirnov@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 package/python-ipython/python-ipython.hash | 4 ++--
 package/python-ipython/python-ipython.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-ipython/python-ipython.hash b/package/python-ipython/python-ipython.hash
index a223408..af1ed94 100644
--- a/package/python-ipython/python-ipython.hash
+++ b/package/python-ipython/python-ipython.hash
@@ -1,3 +1,3 @@
 # md5 from https://pypi.python.org/pypi/ipython/json, sha256 locally computed
-md5 19e4a46ec7d7a32d068de4c253c9b459 ipython-5.2.2.tar.gz
-sha256 6ee1c89f6031e0c86727820ad394c6eb4d3ac28de48e0df3b9367ccf92e212e2 ipython-5.2.2.tar.gz
+md5 d8cc938f46801060239184a35ec9c5a6 ipython-5.4.0.tar.gz
+sha256 6907826c427c917bf0cdab71ee728288b1f1975c4b94b3ed608b67db3183c974 ipython-5.4.0.tar.gz
diff --git a/package/python-ipython/python-ipython.mk b/package/python-ipython/python-ipython.mk
index e57d69d..5d92546 100644
--- a/package/python-ipython/python-ipython.mk
+++ b/package/python-ipython/python-ipython.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_IPYTHON_VERSION = 5.2.2
+PYTHON_IPYTHON_VERSION = 5.4.0
 PYTHON_IPYTHON_SOURCE = ipython-$(PYTHON_IPYTHON_VERSION).tar.gz
-PYTHON_IPYTHON_SITE = https://pypi.python.org/packages/6e/cf/c2a3ca5942e2d8084574157a8f818efafb7218204cd9e41166c92c452e07
+PYTHON_IPYTHON_SITE = https://pypi.python.org/packages/36/cd/765f53135bbbbcd691858aba3af124453a230fe0c752f009f69012fce5d5
 PYTHON_IPYTHON_LICENSE = BSD-3-Clause
 PYTHON_IPYTHON_LICENSE_FILES = COPYING.rst
 PYTHON_IPYTHON_SETUP_TYPE = distutils
-- 
2.9.4
