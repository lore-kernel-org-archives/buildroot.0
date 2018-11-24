From: Asaf Kahlon <asafka7@gmail.com>
Date: Sat, 24 Nov 2018 19:50:49 +0200
Subject: [Buildroot] [PATCH 1/1] python-crossbar: bump to version 18.11.2
Message-ID: <20181124175049.19961-1-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-crossbar/python-crossbar.hash | 4 ++--
 package/python-crossbar/python-crossbar.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-crossbar/python-crossbar.hash b/package/python-crossbar/python-crossbar.hash
index aee07a7382..4b73f81338 100644
--- a/package/python-crossbar/python-crossbar.hash
+++ b/package/python-crossbar/python-crossbar.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/crossbar/json
-md5	e3f0c51c6c496a3d7f1c62d7f64f23db  crossbar-18.11.1.tar.gz
-sha256	ab24031f40077ee283469aab5f270bdc223b29b1e6f45d69cf38bf4cad80df2a  crossbar-18.11.1.tar.gz
+md5	2f48f40f7a43eced7cb74353a303c3db  crossbar-18.11.2.tar.gz
+sha256	8236f207222167747de006784a431cfa546f98b51f47e82cd71e7008f5a09690  crossbar-18.11.2.tar.gz
 # Locally computed
 sha256  57c8ff33c9c0cfc3ef00e650a1cc910d7ee479a8bc509f6c9209a7c2a11399d6  LICENSE
diff --git a/package/python-crossbar/python-crossbar.mk b/package/python-crossbar/python-crossbar.mk
index de5dcea931..2a796f201f 100644
--- a/package/python-crossbar/python-crossbar.mk
+++ b/package/python-crossbar/python-crossbar.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CROSSBAR_VERSION = 18.11.1
+PYTHON_CROSSBAR_VERSION = 18.11.2
 PYTHON_CROSSBAR_SOURCE = crossbar-$(PYTHON_CROSSBAR_VERSION).tar.gz
-PYTHON_CROSSBAR_SITE = https://files.pythonhosted.org/packages/99/02/7f7f7dee3e8787e44d9452cc1d712183e5903d8a76455693b15a900385eb
+PYTHON_CROSSBAR_SITE = https://files.pythonhosted.org/packages/f8/c7/1388883cb64db073c4878e0c83afedf785fd22e4cebc96523e105a000088
 PYTHON_CROSSBAR_LICENSE = AGPL-3.0
 PYTHON_CROSSBAR_LICENSE_FILES = LICENSE
 PYTHON_CROSSBAR_SETUP_TYPE = setuptools
-- 
2.19.1
