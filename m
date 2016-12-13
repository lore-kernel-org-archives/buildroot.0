From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 13 Dec 2016 12:47:40 -0300
Subject: [Buildroot] [PATCH] python-pyicu: bump to version 1.9.5
Message-ID: <20161213154740.475-1-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/48c/48cfb0fe00fdd52af502f9570d291125fb57b9f0/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/python-pyicu/python-pyicu.hash | 4 ++--
 package/python-pyicu/python-pyicu.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pyicu/python-pyicu.hash b/package/python-pyicu/python-pyicu.hash
index a05a30e..69edba8 100644
--- a/package/python-pyicu/python-pyicu.hash
+++ b/package/python-pyicu/python-pyicu.hash
@@ -1,3 +1,3 @@
 # md5 from https://pypi.python.org/pypi/PyICU/json, sha256 locally computed
-md5	fadaf9f85830632f915cb85875ae9a39  PyICU-1.9.3.tar.gz
-sha256	1a7a96212cb3e42e8df85b9062f1f1d6e207474d44f087218fad1d4ec210fa42  PyICU-1.9.3.tar.gz
+md5	30f85b7272f15b26c110c9f3e3a9e7a0  PyICU-1.9.5.tar.gz
+sha256	73b052b800861fae3281dbaf9c92d12a81cabf3d31912d94c51862e093ef359b  PyICU-1.9.5.tar.gz
diff --git a/package/python-pyicu/python-pyicu.mk b/package/python-pyicu/python-pyicu.mk
index fa3a7f4..5c01421 100644
--- a/package/python-pyicu/python-pyicu.mk
+++ b/package/python-pyicu/python-pyicu.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYICU_VERSION = 1.9.3
+PYTHON_PYICU_VERSION = 1.9.5
 PYTHON_PYICU_SOURCE = PyICU-$(PYTHON_PYICU_VERSION).tar.gz
-PYTHON_PYICU_SITE = https://pypi.python.org/packages/bf/1f/cea237f542e3bb592980008a734850e8cbbc25c19c72c98767c71c1bd9c2
+PYTHON_PYICU_SITE = https://pypi.python.org/packages/a2/9f/1947f288143191b903e58633ee597cb98bc284de28dafb1231b6f8b67b99
 PYTHON_PYICU_LICENSE = MIT
 PYTHON_PYICU_LICENSE_FILES = LICENSE
 PYTHON_PYICU_DEPENDENCIES = icu
-- 
2.10.2
