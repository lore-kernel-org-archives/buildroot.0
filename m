From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Fri, 16 Dec 2016 16:02:48 +0100
Subject: [Buildroot] [PATCH 2/6] python-pytz: bump to version 2016.10
In-Reply-To: <1481900572-7854-1-git-send-email-yegorslists@googlemail.com>
References: <1481900572-7854-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <1481900572-7854-2-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-pytz/python-pytz.hash | 4 ++--
 package/python-pytz/python-pytz.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pytz/python-pytz.hash b/package/python-pytz/python-pytz.hash
index db362ec..fbccc52 100644
--- a/package/python-pytz/python-pytz.hash
+++ b/package/python-pytz/python-pytz.hash
@@ -1,3 +1,3 @@
 # md5 from https://pypi.python.org/pypi/pytz/json, sha256 locally computed
-md5	8d8121d619a43cf0b38a4195de1cb8a5  pytz-2016.7.tar.bz2
-sha256	6eab31709e3a4aea748457707da45e805b650cbb352583805d2417de2a1dd71e  pytz-2016.7.tar.bz2
+md5	88b1d6c50c764579292edce3493c8a3a  pytz-2016.10.tar.bz2
+sha256  7016b2c4fa075c564b81c37a252a5fccf60d8964aa31b7f5eae59aeb594ae02b  pytz-2016.10.tar.bz2
diff --git a/package/python-pytz/python-pytz.mk b/package/python-pytz/python-pytz.mk
index ffcab32..9a8bd07 100644
--- a/package/python-pytz/python-pytz.mk
+++ b/package/python-pytz/python-pytz.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYTZ_VERSION = 2016.7
+PYTHON_PYTZ_VERSION = 2016.10
 PYTHON_PYTZ_SOURCE = pytz-$(PYTHON_PYTZ_VERSION).tar.bz2
-PYTHON_PYTZ_SITE = https://pypi.python.org/packages/53/35/6376f58fb82ce69e2c113ca0ebe5c0f69b20f006e184bcc238a6007f4bdb
+PYTHON_PYTZ_SITE = https://pypi.python.org/packages/d0/e1/aca6ef73a7bd322a7fc73fd99631ee3454d4fc67dc2bee463e2adf6bb3d3
 PYTHON_PYTZ_SETUP_TYPE = setuptools
 PYTHON_PYTZ_LICENSE = MIT
 PYTHON_PYTZ_LICENSE_FILES = LICENSE.txt
-- 
2.1.4
