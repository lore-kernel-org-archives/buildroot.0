From: Romain Naour <romain.naour@gmail.com>
Date: Thu,  6 Jun 2019 22:19:37 +0200
Subject: [Buildroot] [PATCH] package/python-numpy: bump to version 1.16.4
Message-ID: <20190606201937.26049-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

See:
https://github.com/numpy/numpy/releases/tag/v1.16.4

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Asaf Kahlon <asafka7@gmail.com>
Cc: Samuel Martin <s.martin49@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-numpy/python-numpy.hash | 4 ++--
 package/python-numpy/python-numpy.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-numpy/python-numpy.hash b/package/python-numpy/python-numpy.hash
index c1cfacf734..eb4123e3f6 100644
--- a/package/python-numpy/python-numpy.hash
+++ b/package/python-numpy/python-numpy.hash
@@ -1,5 +1,5 @@
-# Copied from https://github.com/numpy/numpy/releases/tag/v1.16.3
-sha256	adf063a3f87ab89393f5eea0eb903293b112fa0a308e8c594a75ffa585d81d4f	numpy-1.16.3.tar.gz
+# Copied from https://github.com/numpy/numpy/releases/tag/v1.16.4
+sha256	a3bccb70ad94091a5b9e2469fabd41ac877c140a6828c2022e35560a2ec0346c	numpy-1.16.4.tar.gz
 # License files, locally calculated
 sha256	6b5086f61fe0c71564a79304ecbaa60f11fa3f3debf82f73d16a611cab102adc	LICENSE.txt
 sha256	426a5a484480f57a295db48c2c04f47bb3274752dd82a7fd6541dfa2cb90f641	doc/sphinxext/LICENSE.txt
diff --git a/package/python-numpy/python-numpy.mk b/package/python-numpy/python-numpy.mk
index 28dccf8be5..5d2fbfc7ad 100644
--- a/package/python-numpy/python-numpy.mk
+++ b/package/python-numpy/python-numpy.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_NUMPY_VERSION = 1.16.3
+PYTHON_NUMPY_VERSION = 1.16.4
 PYTHON_NUMPY_SOURCE = numpy-$(PYTHON_NUMPY_VERSION).tar.gz
 PYTHON_NUMPY_SITE = https://github.com/numpy/numpy/releases/download/v$(PYTHON_NUMPY_VERSION)
 PYTHON_NUMPY_LICENSE = BSD-3-Clause, BSD-2-Clause, PSF, Apache-2.0, MIT, Zlib
-- 
2.21.0
