From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Mon, 22 Feb 2021 15:58:43 +0100
Subject: [Buildroot] [PATCH] package/python-dialog3: bump to version 3.5.1
Message-ID: <20210222145843.20785-1-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-dialog3/python-dialog3.hash | 4 ++--
 package/python-dialog3/python-dialog3.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-dialog3/python-dialog3.hash b/package/python-dialog3/python-dialog3.hash
index 83e26c5727..42a7512e4f 100644
--- a/package/python-dialog3/python-dialog3.hash
+++ b/package/python-dialog3/python-dialog3.hash
@@ -1,5 +1,5 @@
 # md5 from https://pypi.python.org/pypi/pythondialog/json
-md5	3d5ebc33e85f6313964f5eef720dab19  pythondialog-3.4.0.tar.bz2
+md5	07e257d91099b804e040c6ea5ec56041  pythondialog-3.5.1.tar.gz
 # Locally computed
-sha256  019cdbffe3f61d32d6fb158ce48a767478af2aac2f31fb40460b39aefae604fe  pythondialog-3.4.0.tar.bz2
+sha256  34a0687290571f37d7d297514cc36bd4cd044a3a4355271549f91490d3e7ece8  pythondialog-3.5.1.tar.gz
 sha256  a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  COPYING
diff --git a/package/python-dialog3/python-dialog3.mk b/package/python-dialog3/python-dialog3.mk
index 4048447e1f..e2147507bf 100644
--- a/package/python-dialog3/python-dialog3.mk
+++ b/package/python-dialog3/python-dialog3.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_DIALOG3_VERSION = 3.4.0
-PYTHON_DIALOG3_SOURCE = pythondialog-$(PYTHON_DIALOG3_VERSION).tar.bz2
-PYTHON_DIALOG3_SITE = https://pypi.python.org/packages/fa/f4/686742f01ebb5863d4c5e1acab620acfed0fe97280a26b4ed25917f4f333
+PYTHON_DIALOG3_VERSION = 3.5.1
+PYTHON_DIALOG3_SOURCE = pythondialog-$(PYTHON_DIALOG3_VERSION).tar.gz
+PYTHON_DIALOG3_SITE = https://files.pythonhosted.org/packages/72/3c/26ed0db035f97196704d0197d8b2254b8a6ca93a2d132430b0b0d597aa79
 PYTHON_DIALOG3_LICENSE = LGPL-2.1+
 PYTHON_DIALOG3_LICENSE_FILES = COPYING
 PYTHON_DIALOG3_SETUP_TYPE = distutils
-- 
2.17.0
